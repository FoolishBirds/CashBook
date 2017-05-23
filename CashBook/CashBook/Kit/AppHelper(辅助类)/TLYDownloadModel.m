//
//  TLYDownloadModel.m
//  Delete
//
//  Created by TLY on 2017/3/15.
//  Copyright © 2017年 hampoo. All rights reserved.
//

#import "TLYDownloadModel.h"
#define DownloadUrl @"downloadUrl"
#define FileName @"fileName"
#define ExpectedBytes @"expectedBytes"
#define DownloadState @"downloadState"
#define Process @"process"

@implementation TLYDownloadModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.downloadUrl forKey:DownloadUrl];
    [aCoder encodeObject:self.fileName forKey:FileName];
    [aCoder encodeFloat:self.expectedBytes forKey:ExpectedBytes];
    [aCoder encodeInt:self.downloadState forKey:DownloadState];
//    [aCoder encodeObject:self.process forKey:Process];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.downloadUrl = [aDecoder decodeObjectForKey:DownloadUrl];
        self.fileName = [aDecoder decodeObjectForKey:FileName];
        self.expectedBytes = [aDecoder decodeFloatForKey:ExpectedBytes];
        self.downloadState = [aDecoder decodeIntForKey:DownloadState];
//        self.process = [aDecoder decodeObjectForKey:Process];
    }
    return self;
}
@end
