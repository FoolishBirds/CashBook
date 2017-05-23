//
//  UIScrollView+TLYScrollView.m
//  CashBook
//
//  Created by TLY on 2017/4/5.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "UIScrollView+TLYScrollView.h"

@implementation UIScrollView (TLYScrollView)
/***************************************/
- (CGFloat)tly_contentWidth {
    return self.contentSize.width;
}

- (void)setTly_contentWidth:(CGFloat)tly_contentWidth
{
    self.contentSize = CGSizeMake(tly_contentWidth, self.frame.size.height);
}

- (CGFloat)tly_contentHeight {
    return self.contentSize.height;
}

- (void)setTly_contentHeight:(CGFloat)tly_contentHeight
{
    self.contentSize = CGSizeMake(self.frame.size.width, tly_contentHeight);
}

- (CGFloat)tly_contentOffsetX {
    return self.contentOffset.x;
}

- (void)setTly_contentOffsetX:(CGFloat)tly_contentOffsetX
{
    self.contentOffset = CGPointMake(tly_contentOffsetX, self.contentOffset.y);
}

- (CGFloat)tly_contentOffsetY {
    return self.contentOffset.y;
}

- (void)setTly_contentOffsetY:(CGFloat)tly_contentOffsetY
{
    self.contentOffset = CGPointMake(self.contentOffset.x, tly_contentOffsetY);
}
/***************************************/
- (CGPoint)tly_topContentOffset
{
    return CGPointMake(0.0f, -self.contentInset.top);
}

- (CGPoint)tly_bottomContentOffset
{
    return CGPointMake(0.0f, self.contentSize.height + self.contentInset.bottom - self.bounds.size.height);
}

- (CGPoint)tly_leftContentOffset
{
    return CGPointMake(-self.contentInset.left, 0.0f);
}

- (CGPoint)tly_rightContentOffset
{
    return CGPointMake(self.contentSize.width + self.contentInset.right - self.bounds.size.width, 0.0f);
}
/***************************************/
- (TLYScrollDirection)tly_ScrollDirection
{
    TLYScrollDirection direction;
    
    if ([self.panGestureRecognizer translationInView:self.superview].y > 0.0f)
    {
        direction = TLYScrollDirectionUp;
    }
    else if ([self.panGestureRecognizer translationInView:self.superview].y < 0.0f)
    {
        direction = TLYScrollDirectionDown;
    }
    else if ([self.panGestureRecognizer translationInView:self].x < 0.0f)
    {
        direction = TLYScrollDirectionLeft;
    }
    else if ([self.panGestureRecognizer translationInView:self].x > 0.0f)
    {
        direction = TLYScrollDirectionRight;
    }
    else
    {
        direction = TLYScrollDirectionUnknow;
    }
    
    return direction;
}
/***************************************/
- (BOOL)tly_isScrolledToTop
{
    return self.contentOffset.y <= [self tly_topContentOffset].y;
}
- (BOOL)tly_isScrolledToBottom
{
    return self.contentOffset.y >= [self tly_bottomContentOffset].y;
}
- (BOOL)tly_isScrolledToLeft
{
    return self.contentOffset.x <= [self tly_leftContentOffset].x;
}
- (BOOL)tly_isScrolledToRight
{
    return self.contentOffset.x >= [self tly_rightContentOffset].x;
}
/***************************************/
- (void)tly_scrollToTopAnimated:(BOOL)animated
{
    [self setContentOffset:[self tly_topContentOffset] animated:animated];
}
- (void)tly_scrollToBottomAnimated:(BOOL)animated
{
    [self setContentOffset:[self tly_bottomContentOffset] animated:animated];
}
- (void)tly_scrollToLeftAnimated:(BOOL)animated
{
    [self setContentOffset:[self tly_leftContentOffset] animated:animated];
}
- (void)tly_scrollToRightAnimated:(BOOL)animated
{
    [self setContentOffset:[self tly_rightContentOffset] animated:animated];
}

@end
