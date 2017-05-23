//
//  CABasicAnimation+TLYAnimation.m
//  Delete
//
//  Created by TLY on 2017/3/16.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "CABasicAnimation+TLYAnimation.h"
#import <objc/runtime.h>
static const char *completionKey = "completionKey";

@implementation CABasicAnimation (TLYAnimation)

+ (instancetype)getSingleAnimationBySetAnimationType:(AnimationType)type from:(NSValue *)fromValue to:(NSValue *)toValue duration:(float)duration moveType:(moveType)moveType keepState:(BOOL)keep completionHanlder:(void(^)())completion
{
    CABasicAnimation *animation = [self animation];
    return [animation getSingleAnimationBySetAnimationType:type from:fromValue to:toValue duration:duration moveType:moveType keepState:keep completionHanlder:completion];
}

- (instancetype)getSingleAnimationBySetAnimationType:(AnimationType)type from:(NSValue *)fromValue to:(NSValue *)toValue duration:(float)duration moveType:(moveType)moveType keepState:(BOOL)keep completionHanlder:(void(^)())completion
{
    NSString *animationKeyPathName;
    CAMediaTimingFunction *function;
    switch (type) {
        case AnimationTypeOpacity:
            animationKeyPathName = @"opacity";
            break;
        case AnimationTypeScale:
            animationKeyPathName = @"transform.scale";
            break;
        case AnimationTypeRotation:
            animationKeyPathName = @"transform.rotation";
            break;
        default:
            animationKeyPathName = @"position";
            break;
    }
    switch (moveType) {
        case moveTypeLinear:
            function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            break;
        case moveTypeEaseIn:
            function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            break;
        case moveTypeEaseOut:
            function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            break;
        case moveTypeEaseInEaseOut:
            function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            break;
        default:
            function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
            break;
    }
    self.keyPath = animationKeyPathName;
    if (duration != 0) {
        self.duration = duration;
    }
    self.speed =1.f;
    self.timingFunction = function;
    self.removedOnCompletion = NO;
    self.fromValue = fromValue;
    self.toValue = toValue;
    self.fillMode = keep ? kCAFillModeBoth : kCAFillModeRemoved;
    
    self.delegate =self;
    objc_setAssociatedObject(self, completionKey, completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return self;
}

#pragma mark - CAAnimation Delegate
- (void)animationDidStart:(CAAnimation *)anim
{
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    void(^block)() = objc_getAssociatedObject(self, completionKey);
    if (block) {
        block();
    }
}
@end
