//
//  AnimationTool.h
//  Delete
//
//  Created by TLY on 2017/3/16.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CABasicAnimation+TLYAnimation.h"

@interface AnimationTool : NSObject<CAAnimationDelegate>

@property (nonatomic, copy) void(^springAnimationBlock)();
+ (instancetype)sharedInstance;
/**
 视图添加组动画

 @param superView 视图
 @param value1 透明度 0-1
 @param value2 大小 0 -
 @param value3 旋转角度 end angel = 0
 @param value4 起始坐标 end point = center
 @param moveType 视图动画类型
 @param completion 视图动画结束回调
 */
- (void)setAnimationsOnView:(UIView *)superView Withopacity:(float)value1 scale:(float)value2 rotation:(float)value3 position:(CGPoint)value4 AndMoveType:(moveType)moveType completionHandler:(void(^)())completion;
/**
 弹性动画 CASpringAnimation suppoerts iOS9 or later

 @param view animation on view
 @param framef 初始位置
 @param framet 结束位置
 @param duration 持续时间
 @param times 来、回弹动次数之和
 @param stretchPercent 发散、收缩百分比，弹动形变最大值
 @param completion 结束回调
 */
-(void)startAnimationOnView:(UIView *)view FromFrame:(CGRect)framef toFrame:(CGRect)framet duration:(CGFloat)duration shakeTimes:(NSInteger)times stretchPercent:(CGFloat)stretchPercent completion:(void (^)(BOOL finished))completion;
@end
