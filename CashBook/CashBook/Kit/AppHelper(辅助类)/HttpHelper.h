//
//  HttpHelper.h
//  Delete
//
//  Created by TLY on 2017/3/15.
//  Copyright © 2017年 hampoo. All rights reserved.
//  统一单例类，管理所有网络请求

#import <Foundation/Foundation.h>

//请求超时
#define TLYTimeout 15
typedef void(^SuccessBlock)(id resultObj);
typedef void(^FailureBlock)(NSError *error);

@interface HttpHelper : NSObject

+ (instancetype)sharedInstance;
//General HTTP Request
- (void)TLYGetDataWithUrl:(NSString *)url params:(NSDictionary *)userInfo sussess:(SuccessBlock)success failure:(FailureBlock)failure;
- (void)TLYPostDataWithUrl:(NSString *)url params:(NSDictionary *)userInfo sussess:(SuccessBlock)success failure:(FailureBlock)failure;

@end
