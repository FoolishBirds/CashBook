//
//  TLYDownloadModel.h
//  Delete
//
//  Created by TLY on 2017/3/15.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import <Foundation/Foundation.h>

//文件下载状态
typedef NS_ENUM(NSInteger, DownloadState) {
    DownloadStateSuspend,                //暂停
    DownloadStateGoing,                  //下载中
    DownloadStateCompleted,             //已完成
    DownloadStateFailed,                //失败
};

@interface TLYDownloadModel : NSObject <NSCoding>
@property (nonatomic, copy) NSString *downloadUrl;          //下载文件路径
@property (nonatomic, copy) NSString *fileName;             //下载文件名
//@property (nonatomic, assign) CGFloat downloadBytes;        //文件已下载大小,文件大小现在采用本地计算方式获得
@property (nonatomic, assign) CGFloat expectedBytes;        //文件大小
@property (nonatomic, assign) DownloadState downloadState;  //文件状态

//@property (nonatomic, strong) NSOutputStream *stream;       //write stream
//@property (nonatomic, strong) NSURLSessionDataTask *task;    //task
//@property (nonatomic, copy) void(^process)(NSInteger, NSInteger); //process回调
@end
