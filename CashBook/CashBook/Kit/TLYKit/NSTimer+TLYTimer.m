//
//  NSTimer+TLYTimer.m
//  Delete
//
//  Created by TLY on 2017/3/14.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "NSTimer+TLYTimer.h"

@implementation NSTimer (TLYTimer)
+ (NSTimer *)TLYScheduledTimerWithTimerInterval:(NSTimeInterval)timeInterval block:(void(^)())block repeats:(BOOL)repeats
{
   NSTimer *timer = [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(action:) userInfo:block repeats:repeats];
    return timer;
}

+ (void)action:(NSTimer *)timer
{
    if ([timer userInfo]) {
        void(^block)() = (void(^)())[timer userInfo];
        block();
    }
}

@end
