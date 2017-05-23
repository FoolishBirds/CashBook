//
//  AppHelper.h
//  Delete
//
//  Created by TLY on 2017/3/14.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppHelper : NSObject
//生成标题式导航栏按钮
+ (UIButton *)getNaviBarBtn:(NSString *)title target:(id)target action:(SEL)selector frame:(CGRect)frame isLeft:(BOOL)isLeft;
//返回文件类型
+ (UIButton *)getNavigationBtnImage:(UIImage *)btnImage target:(id)target action:(SEL)selector frame:(CGRect)frame;
//返回文件类型
+ (FileType)getFileTypeWithFileName:(NSString *)fileName isFolder:(BOOL)isFolder;
//根据文件类型返回相应的文件图标
+ (UIImage *)getIconImageWithFileType:(FileType)fileType;

@end
