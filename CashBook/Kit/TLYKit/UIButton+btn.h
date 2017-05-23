//
//  UIButton+btn.h
//  UIButton
//
//  Created by TLY on 16/9/30.
//  Copyright © 2016年 hampoo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^btnTappedCallBack)(void);
@interface UIButton (btn)
- (void)action1 :(UIControlEvents)event :(btnTappedCallBack)myBlock;
@end
