//
//  BaseTabbarController.h
//  CashBook
//
//  Created by TLY on 2017/4/5.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DCPathButton.h>

@interface BaseTabbarController : UITabBarController <DCPathButtonDelegate>

/**
 自定义tabbarController

 @param className 类名数组
 @param titleName 标题名数组
 @param unSelImage 未选中图片名数组
 @param selImage 选中图片名数组
 @return 返回tabbarController
 */
- (instancetype)initWithClassName:(NSArray *)className titleName:(NSArray *)titleName unSelectedImageName:(NSArray *)unSelImage SelectedImageName:(NSArray *)selImage;
@end
