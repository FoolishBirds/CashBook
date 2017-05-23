//
//  AnimationTool.m
//  Delete
//
//  Created by TLY on 2017/3/16.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "AnimationTool.h"


static char *const groupAnimationKey = "groupAnimationKey";
static char *const springAnimationKey = "springAnimationKey";
static NSString *const group = @"group";
static char *const kitKey = "kitKey";
static AnimationTool *instance = nil;
static float const durationTime = 10.f;

@implementation AnimationTool

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (void)setSpringAnimationBlock:(void (^)())springAnimationBlock
{
    objc_setAssociatedObject(self, springAnimationKey, springAnimationBlock, OBJC_ASSOCIATION_COPY);
}

- (void (^)())springAnimationBlock
{
    return objc_getAssociatedObject(self, springAnimationKey);
}

- (void)setAnimationsOnView:(UIView *)superView Withopacity:(float)value1 scale:(float)value2 rotation:(float)value3 position:(CGPoint)value4 AndMoveType:(moveType)moveType completionHandler:(void(^)())completion
{
    CABasicAnimation *opacityAnimation = [CABasicAnimation getSingleAnimationBySetAnimationType:AnimationTypeOpacity from:@(value1) to:@1 duration:0 moveType:moveType keepState:YES completionHanlder:nil];
    CABasicAnimation *scaleAnimation = [CABasicAnimation getSingleAnimationBySetAnimationType:AnimationTypeScale from:@(value2) to:@1 duration:0 moveType:moveType keepState:YES completionHanlder:nil];
    CABasicAnimation *rotationAnimation = [CABasicAnimation getSingleAnimationBySetAnimationType:AnimationTypeRotation from:@(value3) to:@0 duration:0 moveType:moveType keepState:YES completionHanlder:nil];
    CABasicAnimation *positionAnimation = [CABasicAnimation getSingleAnimationBySetAnimationType:AnimationTypePosition from:[NSValue valueWithCGPoint:value4] to:[NSValue valueWithCGPoint:CGPointMake(superView.center.x, superView.center.y)] duration:0 moveType:moveType keepState:YES completionHanlder:nil];
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[scaleAnimation, opacityAnimation, rotationAnimation, positionAnimation];
    NSLog(@"%f---%@--%@--%@",scaleAnimation.duration,scaleAnimation.fromValue,scaleAnimation.toValue,scaleAnimation.timingFunction);
    groupAnimation.delegate = self;
    objc_setAssociatedObject(self, groupAnimationKey, completion, OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self, kitKey, superView, OBJC_ASSOCIATION_RETAIN);
    
    [superView.layer addAnimation:groupAnimation forKey:group];
    
}
-(void)startAnimationOnView:(UIView *)view FromFrame:(CGRect)framef
                       toFrame:(CGRect)framet
                      duration:(CGFloat)duration
                    shakeTimes:(NSInteger)times
                stretchPercent:(CGFloat)stretchPercent
                    completion:(void (^)(BOOL finished))completion
{
    view.layer.masksToBounds = YES;
    
    __block CGFloat perTime = duration / times;
    __block CGFloat perx = (framet.origin.x - framef.origin.x) * stretchPercent / times;
    __block CGFloat pery = (framet.origin.y - framef.origin.y) * stretchPercent / times;
    __block CGFloat perw = (framet.size.width - framef.size.width) * stretchPercent / times;
    __block CGFloat perh = (framet.size.height - framef.size.height) * stretchPercent / times;
    
    __block UIView * tmpView = view;
    __block NSInteger tmpTimes = (NSInteger)times;
    __block NSInteger tmpsymbol = -1;
    
    __weak typeof(self) weakSelf = self;
    self.springAnimationBlock = ^{
        
        [UIView animateWithDuration:perTime animations:^{
            
            CGFloat x = framet.origin.x + perx * tmpTimes;
            CGFloat y = framet.origin.y + pery * tmpTimes;
            CGFloat w = framet.size.width + perw * tmpTimes;
            CGFloat h = framet.size.height + perh * tmpTimes;
            CGRect rect = CGRectMake(x, y, w, h);
            
            tmpView.frame = rect;
        }completion:^(BOOL finished) {
            
            tmpTimes = tmpTimes + tmpsymbol;
            tmpTimes = - tmpTimes;
            tmpsymbol = - tmpsymbol;
            if (tmpTimes != 0) {
                weakSelf.springAnimationBlock();
            }else{
                [UIView animateWithDuration:perTime animations:^{
                    tmpView.frame = framet;
                }completion:^(BOOL finished) {
                    completion(YES);
                }];
            }
        }];
    };
    
    self.springAnimationBlock();
}
#pragma mark - CAAnimation Delegate
- (void)animationDidStart:(CAAnimation *)anim
{
    UIView * view = objc_getAssociatedObject(self, kitKey);
    view.userInteractionEnabled = NO;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    void(^block)() = objc_getAssociatedObject(self, groupAnimationKey);
    UIView * view = objc_getAssociatedObject(self, kitKey);
    view.userInteractionEnabled = YES;
    if (block) {
        block();
    }
}
@end
