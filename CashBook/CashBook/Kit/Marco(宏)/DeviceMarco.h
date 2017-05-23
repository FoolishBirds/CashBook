//
//  DeviceMarco.h
//  Delete
//
//  Created by TLY on 2017/3/14.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#ifndef DeviceMarco_h
#define DeviceMarco_h

//1.判断设备尺寸是否为4英寸
#define KMyDeviceIs4Inch  ([UIScreen mainScreen].bounds.size.height == 568)
//2.判断系统版本号
#define KCurrentSyetemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define KMyVersionHigherThan7 ([UIDevice currentDevice].systemVersion.floatValue >= 7.0)
#define KMyVersionHigherThan8 ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
//3.判断设备类型
#define KMyDeviceIpad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define KMyDeviceIphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define KMyDeviceIphone4s (KIS_IPHONE && KWindowSize.height < 568.0)
#define KMyDeviceIphone5 (KIS_IPHONE && KWindowSize.height == 568.0)
#define KMyDeviceIphone6 (KIS_IPHONE && KWindowSize.height == 667.0)
#define KMyDeviceIphone6P (KIS_IPHONE && KWindowSize.height == 736.0)
//4.自定义log--发布打包自动去掉注释
#ifdef DEBUG        //调试
#define KMyLog(fmt,...) {NSLog((@"%s [Line %d] DEBUG:--->" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#else               //发布打包
#define KmyLog(...)
#endif
//5.控件高度
#define kStatusBarHeight 20.0f
#define kNaviBarHeight 44.0f
#define kTopBarHeight 64.0f
#define kButtomBarHeight 49.0f
//6.屏幕宽、高
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreen
//7.文件夹路径
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kDocumentsPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define kCachesPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define kTempPath NSTemporaryDirectory()
//8.常用单例
#define KApplication (UIApplication *)[UIApplication sharedApplication]
#define kNotificationCenter        [NSNotificationCenter defaultCenter]
#define kFileManager               [NSFileManager defaultManager]
#define kCurrentKeyWindow          [UIApplication sharedApplication].keyWindow
//9.弱引用
#define WEAKSELF typeof(self) __weak weakSelf = self;
//10.正则表达式
#define NumAndLetterString @"^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$"  //必须包含大小写字母和数字的组合，不能使用特殊字符，长度8-10
#define ChineseString "^[\\u4e00-\\u9fa5]{0,}$"    //校验中文
#define NumAndLetterAndUnderlineString @"^\\w+$"    //字母、数字或下划线
#define EmailVaildString @"[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?"    //Email地址校验
#define IDCard15VaildString @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$"    //校验身份证号码15位
#define IDCard18VaildString @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$"    //校验身份证号码18位
#define PhoneNumString @"^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$"     //校验手机号13、15、18开头
#define IP4String @"\\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\b"   //校验IP-V4地址
#define IP6String @"(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))"          //校验IP-V6地址
#define JudgeHttpString(s) @"if (!s.match(/^[a-zA-Z]+:\\/\\//)){    s = 'http://' + s; }"        //检查URL前缀
#define KGetColor(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#endif /* DeviceMarco_h */
