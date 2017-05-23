//
//  MyTool.m
//  Delete
//
//  Created by TLY on 2017/3/14.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "MyTool.h"

@implementation MyTool
#pragma mark -
#pragma mark - VC
+ (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    
    return result;
}
+ (UIView *)getTopViewFrom:(UIViewController *)VC
{
    UIView *view = VC.view;
    UIView *topView = view.superview.subviews.lastObject;
    while (topView.subviews.lastObject) {
        topView = topView.subviews.lastObject;
    }
    return topView;
}
+ (UIViewController *)getNearsetVCFrom:(UIView *)view
{
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

#pragma mark -
#pragma mark - JSON
+ (NSData *)toJSONData:(id)object {
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if ([jsonData length] > 0 && error == nil){
        return jsonData;
    }else{
        return nil;
    }
}

+ (NSString *)toJsonString:(id)object {
    NSData *jsonData = [MyTool toJSONData:object];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    
    return jsonString;
}
//+ (NSString *)toJSonString:(NSData *)data {
//    NSString *JSONString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    
//}
#pragma mark - 
#pragma mark - 时间
+ (NSDate *)NSStringToNSDate:(NSString*)string {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if ([string rangeOfString:@"/"].length > 0) {
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];  //HH:mm:ss
    }else{
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

+ (NSString *)NSDateToNSString:(NSDate*)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSString *)getCurrentDateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    return strDate;
}

+ (NSString *)transferTimeStamp:(double)timeStamp
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    return [formatter stringFromDate:date];
}

+ (NSString *)distanceTimeWithBeforeTime:(double)beTime
{
    NSTimeInterval now = [[NSDate date]timeIntervalSince1970];
    double distanceTime = now - beTime;
    NSString * distanceStr;
    
    NSDate * beDate = [NSDate dateWithTimeIntervalSince1970:beTime];
    NSDateFormatter * df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    NSString * timeStr = [df stringFromDate:beDate];
    
    [df setDateFormat:@"dd"];
    NSString * nowDay = [df stringFromDate:[NSDate date]];
    NSString * lastDay = [df stringFromDate:beDate];
    
    if (distanceTime < 60) {//小于一分钟
        distanceStr = @"刚刚";
    }
    else if (distanceTime <60*60) {//时间小于一个小时
        distanceStr = [NSString stringWithFormat:@"%ld分钟前",(long)distanceTime/60];
    }
    else if(distanceTime <24*60*60 && [nowDay integerValue] == [lastDay integerValue]){//时间小于一天
        distanceStr = [NSString stringWithFormat:@"今天 %@",timeStr];
    }
    else if(distanceTime<24*60*60*2 && [nowDay integerValue] != [lastDay integerValue]){
        
        if ([nowDay integerValue] - [lastDay integerValue] ==1 || ([lastDay integerValue] - [nowDay integerValue] > 10 && [nowDay integerValue] == 1)) {
            distanceStr = [NSString stringWithFormat:@"昨天 %@",timeStr];
        }
        else{
            [df setDateFormat:@"   HH:mm"]; //MM-dd HH:mm
            distanceStr = [df stringFromDate:beDate];
        }
        
    }
    else if(distanceTime <24*60*60*365){
        [df setDateFormat:@"   HH:mm"];
        distanceStr = [df stringFromDate:beDate];
    }
    else{
        [df setDateFormat:@"   HH:mm"];
        distanceStr = [df stringFromDate:beDate];
    }
    return distanceStr;
}

#pragma mark -
#pragma mark - 字符串
+ (NSString *)getFrontStrOn:(NSString *)originStr byDeleteStr:(NSString *)deleteStr {
    NSString *newUserName = originStr;
    NSRange range = [originStr rangeOfString:deleteStr];
    if(range.location != NSNotFound)
    {
        newUserName = [originStr substringToIndex:range.location];
    }
    return newUserName;
}

+ (NSString *)getRearStrOn:(NSString *)originStr byDeleteStr:(NSString *)deleteStr {
    NSString *newUserName = originStr;
    NSRange range = [originStr rangeOfString:deleteStr];
    if(range.location != NSNotFound) {
        newUserName = [originStr substringFromIndex:(range.location + range.length)];
    }
    return newUserName;
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
+ (NSString *)encodeWithChineseStr:(NSString *)str {
    NSString *encodedStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return encodedStr;
}

+ (NSString *)decodeWithChineseStr:(NSString *)str {
    NSString *decodeStr = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return decodeStr;
}
#pragma clang diagnostic pop
+(NSString *)clearSpaceOnSides:(NSString *)str {
    NSString *resultStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return resultStr;
}

+(NSString *)dealWithStr:(NSString *)str byReplace:(NSString *)replacedStr toNew:(NSString *)newStr{
    if (str.length){
        return [str stringByReplacingOccurrencesOfString:replacedStr withString:newStr];
    }
    return nil;
}

+ (BOOL)isEqualCaseInsensitive:(NSString *)str1 withStr:(NSString *)str2 {
    // NSLiteralSearch 区分大小写(完全比较)
    // NSCaseInsensitiveSearch 不区分大小写
    // NSNumericSearch 只比较字符串的个数，而不比较字符串的字面值
    NSComparisonResult result = [str1 compare:str2 options:NSCaseInsensitiveSearch];
    return result == NSOrderedSame;
}

+ (NSString *)isValidString:(NSString *)str {
    if (!str) return nil;
    if ([str isKindOfClass:[NSNull class]] || [str isEqual:[NSNull null]] || [str isEqualToString:@"(null)"] || [str isEqualToString:@"<null>"] || [str isEqualToString:@"null"] || [str isEqualToString:@""] || [str isEqualToString:@"\0000"]) {
        return nil;
    }
    return str;
}
#pragma mark -
#pragma mark - UIKit
+ (void)supView:(UIView *)superView addSubviews:(NSArray *)subviews
{
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if ([view isKindOfClass:[UIView class]]) {
            [superView addSubview:view];
        }
    }];
}

+ (void)supView:(UIView *)superView removeSubviews:(NSArray *)subviews
{
    [subviews enumerateObjectsUsingBlock:^(UIView *view , NSUInteger idx, BOOL * _Nonnull stop) {
        if ([view isKindOfClass:[UIView class]]) {
            [view removeFromSuperview];
            view = nil;
        }
    }];
}

+ (void)setView:(UIView *)view ShadowWithColor:(UIColor *)color
{
    view.layer.shadowColor=color.CGColor;
    view.layer.shadowOffset=CGSizeMake(0, 3);
    view.layer.shadowOpacity=0.7;
    view.layer.shadowRadius=5;
}

#pragma mark -
#pragma mark - Other
+ (id)isValidObj:(id)obj {
    if (!obj) return nil;
    if ([obj isKindOfClass:[NSNull class]] || [obj isEqual:[NSNull null]]) {
        return nil;
    }
    return obj;
}
+ (void)createFileFolderAtDirectory:(NSString *)folderPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) {
        [manager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
}
+ (NSInteger)calculateFileSizeAtPath:(NSString *)filePath
{
    return [[kFileManager attributesOfItemAtPath:filePath error:nil][NSFileSize]integerValue];
    
}

+ (BOOL)judgeWheaterIsFirstTimeToLogin
{
    if (![[NSUserDefaults standardUserDefaults]boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"firstLauch"];
        return NO;
    }else{
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"firstLaunch"];
        return YES;
    }
}
@end
