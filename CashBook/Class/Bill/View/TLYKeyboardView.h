//
//  TLYKeyboardView.h
//  CashBook
//
//  Created by TLY on 2017/4/6.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, KeyboardAction) {
    KeyboardActionPlus,         //加
    KeyboardActionMinus,        //减
    KeyboardActionCalculate,    //计算结果
    KeyboardActionDelete,       //删除
    KeyboardActionConfirm,      //确认
};
typedef void(^KeyboardNumBlock)(NSString *);
typedef void(^KeyboardActionBlock)(KeyboardAction);
typedef void(^ResultBlock)(NSString *resultStr);

@interface TLYKeyboardView : UIView
@property (nonatomic, copy) KeyboardNumBlock keyboardNumBlock;
@property (nonatomic, copy) KeyboardActionBlock keyboardActionBlock;
@property (nonatomic, copy) ResultBlock resultBlock;
@property (nonatomic, copy) NSString *contentString;
@end

@protocol TLYCalcuDelegate <NSObject>



@end
