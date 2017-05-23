//
//  BillVC.h
//  CashBook
//
//  Created by TLY on 2017/4/5.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "BaseVC.h"

@interface BillVC : BaseVC
@property (nonatomic,copy)void (^scrollDirectionChanged)(BOOL isScrollUp);
@end
