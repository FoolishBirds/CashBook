//
//  UIButton+btn.m
//  UIButton
//
//  Created by TLY on 16/9/30.
//  Copyright © 2016年 hampoo. All rights reserved.
//

#import "UIButton+btn.h"
#import <objc/runtime.h>

static void * BuClickKey = @"ButtonClickKey";

@implementation UIButton (btn)
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)action1 :(UIControlEvents)event :(btnTappedCallBack)myBlock
{
    [self addTarget:self action:@selector(doAction1:) forControlEvents:event];
    
    objc_setAssociatedObject(self, BuClickKey, myBlock, OBJC_ASSOCIATION_COPY);//宿主对象被释放，关联对象释放
}

- (void)doAction1:(UIButton *)btn
{
    
    void (^block)(void)=objc_getAssociatedObject(self, BuClickKey);
    if (block) {
        block();
    }
    
}
@end
