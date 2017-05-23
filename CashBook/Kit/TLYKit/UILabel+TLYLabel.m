//
//  UILabel+TLYLabel.m
//  YYModel_learning
//
//  Created by TLY on 2017/3/13.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "UILabel+TLYLabel.h"

@implementation UILabel (TLYLabel)

+ (instancetype)TLYLabelAdjustWidthWithFrame:(CGRect)rect Title:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor
{
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    [label setText:title];
    [label setTextColor:titleColor];
    [label setBackgroundColor:backgroundColor];
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    CGSize size = [self adjustWidthWithLabel:label andFontSize:fontSize];
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, size.width, size.height);
    return label;
}

+ (instancetype)TLYLabelAdjustHeightWithFrame:(CGRect)rect MaxWidth:(float)maxWidth Title:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)fontSize backgroundColor:(UIColor *)backgroundColor
{
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.numberOfLines = 0;
    [label setText:title];
    [label setTextColor:titleColor];
    [label setBackgroundColor:backgroundColor];
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    CGSize size = [self adjustHeightWithLabel:label andFontSize:fontSize AndMaxWidth:maxWidth];
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, maxWidth, size.height);
    return label;
}

+ (CGSize)adjustWidthWithLabel:(UILabel *)label andFontSize:(CGFloat)fontSize
{
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, fontSize) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size;
    return size;
}

+ (CGSize)adjustHeightWithLabel:(UILabel *)label andFontSize:(CGFloat)fontSize AndMaxWidth:(float)maxWidth
{
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:nil].size;
    return size;
}
@end
