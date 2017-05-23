//
//  AppGlobal.h
//  Delete
//
//  Created by TLY on 2017/3/14.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#ifndef AppGlobal_h
#define AppGlobal_h

#pragma mark -
#pragma mark - 文件类型

typedef NS_ENUM(NSInteger, FileType) {
    FileTypeFolder,                 // 文件夹
    FileTypeImage,                  // 图片
    FileTypeTxt,                    // 文本
    FileTypeMicroWord,              // word
    FileTypeMicroExcel,             // excel
    FileTypePPT,                    // ppt
    FileTypeZip,                    // zip
    FileTypeMovie,                  // 视频
    FileTypeAudio,                  // 音频
    FileTypeRar,                    // rar
    FileTypeHtml,                   // html
    FileTypeSqlite,                 // 数据库文件
    FileTypeUnknown,                // 未知
};
#endif /* AppGlobal_h */
