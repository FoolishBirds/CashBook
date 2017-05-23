//
//  UISegmentedControl+TLYSeg.m
//  CashBook
//
//  Created by TLY on 2017/4/6.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "UISegmentedControl+TLYSeg.h"
#import <objc/runtime.h>

static const char * indexValueChangeKey = "indexValueChangeKey";
@implementation UISegmentedControl (TLYSeg)

+ (instancetype)TLYSegSetTitleName:(NSArray *)items tintColor:(UIColor *)tintColor NormalTextColor:(UIColor *)normalColor SelectedTextColor:(UIColor *)selectedColor valueChangedBlock:(ValueChangedBlock)block
{
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:items];
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName : normalColor} forState:UIControlStateNormal];
    [seg setTitleTextAttributes:@{NSForegroundColorAttributeName : selectedColor} forState:UIControlStateSelected];
    seg.tintColor = tintColor;
    seg.layer.borderWidth = 1.f;
    seg.layer.cornerRadius = 3;
    seg.layer.borderColor = tintColor.CGColor;
    [seg setSelectedSegmentIndex:0];
    objc_setAssociatedObject(seg, indexValueChangeKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [seg addTarget:self action:@selector(selectIndexChanged:) forControlEvents:UIControlEventValueChanged];
    return seg;
}

+ (void)selectIndexChanged:(UISegmentedControl *)seg
{
    void(^block)() = objc_getAssociatedObject(seg, indexValueChangeKey);
    if (block) {
        block();
    }
    
}
@end
