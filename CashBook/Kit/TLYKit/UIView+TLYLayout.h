//
//  UIView+TLYLayout.h
//  Delete
//
//  Created by TLY on 2017/3/28.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 提供UIView类控件的set、get方法
 */
@interface UIView (TLYLayout)
@property (assign, nonatomic) CGFloat top;
@property (assign, nonatomic) CGFloat    bottom;
@property (assign, nonatomic) CGFloat    left;
@property (assign, nonatomic) CGFloat    right;

@property (assign, nonatomic) CGFloat    x;
@property (assign, nonatomic) CGFloat    y;
@property (assign, nonatomic) CGPoint    origin;

@property (assign, nonatomic) CGFloat    centerX;
@property (assign, nonatomic) CGFloat    centerY;

@property (assign, nonatomic) CGFloat    width;
@property (assign, nonatomic) CGFloat    height;
@property (assign, nonatomic) CGSize    size;
@end
