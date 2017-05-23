//
//  UILabel+TLYLabel.h
//  YYModel_learning
//
//  Created by TLY on 2017/3/13.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TLYLabel)
//单行保证文字显示最大宽度的label
+ (instancetype)TLYLabelAdjustWidthWithFrame:(CGRect)rect Title:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor;
//保证文字显示最大高度的label
+ (instancetype)TLYLabelAdjustHeightWithFrame:(CGRect)rect MaxWidth:(float)maxWidth Title:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor;
@end
