//
//  UIScrollView+TLYScrollView.h
//  CashBook
//
//  Created by TLY on 2017/4/5.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TLYScrollDirection) {
    TLYScrollDirectionUp,
    TLYScrollDirectionDown,
    TLYScrollDirectionLeft,
    TLYScrollDirectionRight,
    TLYScrollDirectionUnknow
};

@interface UIScrollView (TLYScrollView)
//scrollView的width、height、offsetX、offsetY 的set、get方法
@property(nonatomic) CGFloat tly_contentWidth;
@property(nonatomic) CGFloat tly_contentHeight;
@property(nonatomic) CGFloat tly_contentOffsetX;
@property(nonatomic) CGFloat tly_contentOffsetY;

//scrollView某一方向的偏移坐标
- (CGPoint)tly_topContentOffset;
- (CGPoint)tly_bottomContentOffset;
- (CGPoint)tly_leftContentOffset;
- (CGPoint)tly_rightContentOffset;

- (TLYScrollDirection)tly_ScrollDirection;

- (BOOL)tly_isScrolledToTop;
- (BOOL)tly_isScrolledToBottom;
- (BOOL)tly_isScrolledToLeft;
- (BOOL)tly_isScrolledToRight;

- (void)tly_scrollToTopAnimated:(BOOL)animated;
- (void)tly_scrollToBottomAnimated:(BOOL)animated;
- (void)tly_scrollToLeftAnimated:(BOOL)animated;
- (void)tly_scrollToRightAnimated:(BOOL)animated;
@end
