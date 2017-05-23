//
//  AppHelper.m
//  Delete
//
//  Created by TLY on 2017/3/14.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "AppHelper.h"

@implementation AppHelper

//生成标题式导航栏按钮
+ (UIButton *)getNaviBarBtn:(NSString *)title target:(id)target action:(SEL)selector frame:(CGRect)frame isLeft:(BOOL)isLeft {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, isLeft ? -5: 0, 0, isLeft ? 0: -5)];
    btn.frame = frame;
    return btn;
}
// 生成图片式样的导航栏按钮
+ (UIButton *)getNavigationBtnImage:(UIImage *)btnImage target:(id)target action:(SEL)selector frame:(CGRect)frame {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setImage:btnImage forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -5)];
    btn.frame = frame;
    return btn;
}
//返回文件类型
+ (FileType)getFileTypeWithFileName:(NSString *)fileName isFolder:(BOOL)isFolder {
    if(isFolder) {
        // 文件夹
        return FileTypeFolder;
    }else {
        NSString *pathExtension = [fileName pathExtension];
        if (!pathExtension)return FileTypeUnknown;
        if ([MyTool isEqualCaseInsensitive:pathExtension withStr:@"jpg"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"gif"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"png"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"jpeg"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"jpg"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"gif"]) {
            // 图片类型
            return FileTypeImage;
        }else if ([MyTool isEqualCaseInsensitive:pathExtension withStr:@"txt"]) {
            return FileTypeTxt;
        }else if ([MyTool isEqualCaseInsensitive:pathExtension withStr:@"doc"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"docx"]) {
            return FileTypeMicroWord;
        }else if ([MyTool isEqualCaseInsensitive:pathExtension withStr:@"xlsx"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"xls"]) {
            return FileTypeMicroExcel;
        }else if ([MyTool isEqualCaseInsensitive:pathExtension withStr:@"ppt"]) {
            return FileTypePPT;
        }else if ([MyTool isEqualCaseInsensitive:pathExtension withStr:@"zip"]) {
            return FileTypeZip;
        }else if ([MyTool isEqualCaseInsensitive:pathExtension withStr:@"mp4"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"avi"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"mov"]) {
            return FileTypeMovie;
        }else if ([MyTool isEqualCaseInsensitive:pathExtension withStr:@"mp3"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"wav"] || [MyTool isEqualCaseInsensitive:pathExtension withStr:@"wma"]) {
            return FileTypeAudio;
        }else if ([pathExtension isEqualToString:@"rar"]) {
            return FileTypeRar;
        }else if ([pathExtension isEqualToString:@"html"]) {
            return FileTypeHtml;
        }else if ([pathExtension isEqualToString:@"sqlite"] || [pathExtension isEqualToString:@"db"]) {
            return FileTypeSqlite;
        }else {
            return FileTypeUnknown;
        }
    }
}
//根据文件类型返回相应的文件图标
+ (UIImage *)getIconImageWithFileType:(FileType)fileType {
    switch (fileType) {
        case FileTypeFolder:return KFileFolderIcon;
        case FileTypeImage:return KFileImageIcon;
        case FileTypeTxt:return KFileTxtIcon;
        case FileTypeMicroWord:return KFileMicroWordIcon;
        case FileTypeMicroExcel:return KFileMicroExcelIcon;
        case FileTypePPT:return KFilePPTIcon;
        case FileTypeZip:return KFileZipIcon;
        case FileTypeMovie:return KFileMovieIcon;
        case FileTypeAudio:return KFileAudioIcon;
        case FileTypeRar:return KFileRarIcon;
        case FileTypeHtml:return KFileHtmlIcon;
        case FileTypeSqlite:return KFileSqlIcon;
        case FileTypeUnknown:return KFileUnknownIcon;
        default:return KFileUnknownIcon;
    }
}

@end
