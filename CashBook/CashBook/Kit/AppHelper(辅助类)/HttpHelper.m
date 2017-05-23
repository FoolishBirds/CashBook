//
//  HttpHelper.m
//  Delete
//
//  Created by TLY on 2017/3/15.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "HttpHelper.h"

static HttpHelper *shareInstance = nil;
@implementation HttpHelper

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc]init];
    });
    return shareInstance;
}

- (void)TLYGetDataWithUrl:(NSString *)url params:(NSDictionary *)userInfo sussess:(SuccessBlock)success failure:(FailureBlock)failure
{
    
}

- (void)TLYPostDataWithUrl:(NSString *)url params:(NSDictionary *)userInfo sussess:(SuccessBlock)success failure:(FailureBlock)failure
{
    
}

@end
