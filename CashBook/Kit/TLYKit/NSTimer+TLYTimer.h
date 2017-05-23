//
//  NSTimer+TLYTimer.h
//  Delete
//
//  Created by TLY on 2017/3/14.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^action1)();
@interface NSTimer (TLYTimer)
//这里选择schedule，该方法会将timer加入RunLoop中
+ (NSTimer *)TLYScheduledTimerWithTimerInterval:(NSTimeInterval)timeInterval block:(void(^)())block repeats:(BOOL)repeats;
@end
