//
//  MyTool.h
//  Delete
//
//  Created by TLY on 2017/3/14.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTool : NSObject
//获取当前视图控制器
+ (UIViewController *)getCurrentVC;
//responder方式获取视图的VC
+ (UIViewController *)getNearsetVCFrom:(UIView *)view;
//获取顶层视图
+ (UIView *)getTopViewFrom:(UIViewController *)VC;
//id类型数据转NSData
+ (NSData *)toJSONData:(id)object;
//id类型数据转JSON
+ (NSString *)toJsonString:(id)object;
//NSString->NSDate
+ (NSDate *)NSStringToNSDate:(NSString*)string;
//NSDate 转换成日期 NSString
+ (NSString *)NSDateToNSString:(NSDate*)date;
//当前dateString
+ (NSString *)getCurrentDateString;
//时间戳转时间标示“昨天，今天，刚刚,几分钟前”
+ (NSString *)distanceTimeWithBeforeTime:(double)beTime;
//时间戳转时间string
+ (NSString *)transferTimeStamp:(double)timeStamp;
//删除指定字符后的string
+ (NSString *)getFrontStrOn:(NSString *)originStr byDeleteStr:(NSString *)deleteStr;
// 对字符串进行“指定的字符前面的所有字符”的删除操作，获取指定字符串后一部分
+ (NSString *)getRearStrOn:(NSString *)originStr byDeleteStr:(NSString *)deleteStr;
// 对中文进行编码，返回编码后的字符串
+ (NSString *)encodeWithChineseStr:(NSString *)str;
// 对已编码的中文字符串进行解码，返回正常中文字符串
+ (NSString *)decodeWithChineseStr:(NSString *)str;
// 去掉首位两端空格
+(NSString *)clearSpaceOnSides:(NSString *)str;
// 字符串文本替换
+(NSString *)dealWithStr:(NSString *)str byReplace:(NSString *)replacedStr toNew:(NSString *)newStr;
// 不区分大小写，判断两个字符串是否相同
+ (BOOL)isEqualCaseInsensitive:(NSString *)str1 withStr:(NSString *)str2;
// 判断字符串是否是无效的字符串
+ (NSString *)isValidString:(NSString *)str;
// 对象是否有效
+ (id)isValidObj:(id)obj;
// 快速添加多个subViews
+ (void)supView:(UIView *)superView addSubviews:(NSArray *)subviews;
// 快速移除subviews
+ (void)supView:(UIView *)superView removeSubviews:(NSArray *)subviews;
// 指定目录创建文件夹
+ (void)createFileFolderAtDirectory:(NSString *)folderPath;
// 获取指定路径文件大小
+ (NSInteger)calculateFileSizeAtPath:(NSString *)filePath;
// 判断用户是否是第一次登陆app
+ (BOOL)judgeWheaterIsFirstTimeToLogin;
@end
