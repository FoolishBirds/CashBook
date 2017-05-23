//
//  AppMarco.h
//  Delete
//
//  Created by TLY on 2017/3/14.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#ifndef AppMarco_h
#define AppMarco_h

#pragma mark -
#pragma mark - 文件传输相关

#define KDownloadPath   [NSString stringWithFormat:@"%@/downloadPath",kCachesPath] // 下载文件后放置的路径
#define KUploadTempPath [NSString stringWithFormat:@"%@/uploadTempPath",kCachesPath] // 上传文件时需要将相册图片/视频暂时存放在沙盒中，成功之后暂时不清除，因为可能需要本地浏览，手动删除时再清除
#define TLYDownloadPath [NSString stringWithFormat:@"%@/TLYDownloadPath",kCachesPath]
//#define TLYDownloadPlist [kCachesPath stringByAppendingPathComponent:@"DownloadInfo.plist"]
#define TLYDownloadSqlite [kCachesPath stringByAppendingPathComponent:@"Download.sqlite"]

#define KLatestAutoBackupTime @"latestAutoBackupTime"       //上次自动备份的时间
// 文件夹类型Icon
#define KFileFolderIcon [UIImage imageNamed:@"list_folder"]
// 图片类型
#define KFileImageIcon [UIImage imageNamed:@"list_photo"]
// txt文本类型
#define KFileTxtIcon [UIImage imageNamed:@"list_txt"]
// word类型
#define KFileMicroWordIcon [UIImage imageNamed:@"list_word"]
// excel类型
#define KFileMicroExcelIcon [UIImage imageNamed:@"list_excel"]
// ppt类型
#define KFilePPTIcon [UIImage imageNamed:@"list_ppt"]
// zip压缩包类型
#define KFileZipIcon [UIImage imageNamed:@"list_zip"]
// 视频类型
#define KFileMovieIcon [UIImage imageNamed:@"list_video"]
// 音频类型
#define KFileAudioIcon [UIImage imageNamed:@"list_audio"]
// Rar压缩包类型
#define KFileRarIcon [UIImage imageNamed:@"list_rar"]
// html类型
#define KFileHtmlIcon [UIImage imageNamed:@"list_html"]
// 数据库文件类型
#define KFileSqlIcon [UIImage imageNamed:@"list_sql"]
// 未知文件类型
#define KFileUnknownIcon [UIImage imageNamed:@"list_unknown"]

#define KVoiceLengthSepartedStr @"##"
#endif /* AppMarco_h */
