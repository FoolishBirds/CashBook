//
//  UITextView+TLYTextView.m
//  YYModel_learning
//
//  Created by TLY on 2017/3/13.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "UITextView+TLYTextView.h"
#import <objc/runtime.h>

static float const margin = 8;
static const char *PlaceHolderViewKey = "PlaceHolderViewKey";
static const char *TextViewChangeKey = "TextViewChangeKey";

@implementation UITextView (TLYTextView)

- (UITextView *)placeHolderView
{
    return objc_getAssociatedObject(self, PlaceHolderViewKey);
}

- (void)setPlaceHolderView:(UITextView *)placeHolderView
{
    objc_setAssociatedObject(self, PlaceHolderViewKey, placeHolderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)())textViewChange
{
    return objc_getAssociatedObject(self, TextViewChangeKey);
}

- (void)setTextViewChange:(void (^)())textViewChange
{
    objc_setAssociatedObject(self, TextViewChangeKey, textViewChange, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)addPlaceHolder:(NSString *)placeHolder
{
    if (![self placeHolderView]) {
        self.delegate = self;
        UITextView *textView = [[UITextView alloc]initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor lightGrayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
        [self addSubview:textView];
        [self setPlaceHolderView:textView];
    }else {
        [self placeHolderView].text = placeHolder;
    }
}

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.placeHolderView.hidden = YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text &&[textView.text isEqualToString:@""]) {
        self.placeHolderView.hidden = NO;
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (self.textViewChange) {
        self.textViewChange();
    }
}



+ (instancetype)TLYTextViewSetFrame:(CGRect)rect fontSize:(CGFloat)size PlaceHolder:(NSString *)placeHolder LineNumbers:(NSInteger)lineNumbers
{
    UITextView *txtView = [[UITextView alloc]initWithFrame:rect];
    txtView.text = placeHolder;
    txtView.font = [UIFont systemFontOfSize:16];
    txtView.layer.cornerRadius = 5;
    txtView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    txtView.layer.borderWidth = 1;
    txtView.layer.masksToBounds = YES;
    
    txtView.frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, size + 2*margin);
    return txtView;
}
@end
