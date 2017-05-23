//
//  CABasicAnimation+TLYAnimation.h
//  Delete
//
//  Created by TLY on 2017/3/16.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>


typedef NS_ENUM(NSInteger, AnimationType) {
    AnimationTypeOpacity,
    AnimationTypeScale,
    AnimationTypeRotation,
    AnimationTypePosition
};
typedef NS_ENUM(NSInteger, moveType) {
    moveTypeLinear,
    moveTypeEaseIn,
    moveTypeEaseOut,
    moveTypeEaseInEaseOut,
    moveTypeDefault,
};
@interface CABasicAnimation (TLYAnimation) <CAAnimationDelegate>
//Delegate methods call when single animation built
+ (instancetype)getSingleAnimationBySetAnimationType:(AnimationType)type from:(NSValue *)fromValue to:(NSValue *)toValue duration:(float)duration moveType:(moveType)moveType keepState:(BOOL)keep completionHanlder:(void(^)())completion;
@end
