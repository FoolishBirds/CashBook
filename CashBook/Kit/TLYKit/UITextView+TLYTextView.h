//
//  UITextView+TLYTextView.h
//  YYModel_learning
//
//  Created by TLY on 2017/3/13.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (TLYTextView) <UITextViewDelegate>
@property (nonatomic, strong) UITextView *placeHolderView;
@property (nonatomic, copy) void(^textViewChange)();
+ (instancetype)TLYTextViewSetFrame:(CGRect)rect fontSize:(CGFloat)size PlaceHolder:(NSString *)placeHolder LineNumbers:(NSInteger)lineNumbers;

- (void)addPlaceHolder:(NSString *)placeHolder;
@end
