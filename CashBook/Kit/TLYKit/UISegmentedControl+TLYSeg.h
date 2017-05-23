//
//  UISegmentedControl+TLYSeg.h
//  CashBook
//
//  Created by TLY on 2017/4/6.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ValueChangedBlock)();

@interface UISegmentedControl (TLYSeg)
+ (instancetype)TLYSegSetTitleName:(NSArray *)items tintColor:(UIColor *)tintColor NormalTextColor:(UIColor *)normalColor SelectedTextColor:(UIColor *)selectedColor valueChangedBlock:(ValueChangedBlock)block;
@end
