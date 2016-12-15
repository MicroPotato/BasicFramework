//
//  FileUtil.m
//  IOS沙盒
//
//  Created by whunf on 14-4-21.
//  Copyright (c) 2014年 hwl. All rights reserved.
//

#import "FileUtil.h"

@implementation FileUtil

/**
 * @brief 获取沙盒下的文档目录
 */
+ (NSString *)getSandboxDocument
{
    //苹果建议将程序中创建的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [arr objectAtIndex:0];
}

/**
 * @brief 获取沙盒下的链接目录
 */
+ (NSString *)getSandboxLibary
{
    //存储程序的默认设置或其它状态信息
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES);
    NSString *path = [paths objectAtIndex:0];
    return path;
}

/**
 * @brief 获取沙盒下的临时目录
 */
+ (NSString *)getSandboxTemp
{
    //创建和存放临时文件，退出便删除
    return NSTemporaryDirectory();
}

/**
 * @brief 获取沙盒下的缓存目录
 */
+ (NSString *)getSandboxCache
{
    //存放缓存文件，iIunes不会备份此目录，此目录下文件不会在应用退出删除
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *path = [paths objectAtIndex:0];
    return path;
}

+ (NSString *)getSandboxHome
{
    //沙盒根目录
    return NSHomeDirectory();
}


/**
 * @brief 将文件拷贝到沙盒下
 */
+ (void) copyInitFile:(NSString *) initFile ofType:(NSString *)type toPath:(NSInteger )pathCode
{
    NSArray *filepaths = NSSearchPathForDirectoriesInDomains(pathCode, NSUserDomainMask, YES);
    NSString *fileDirectory = [filepaths objectAtIndex:0];
    NSString *allFileName = [NSString stringWithFormat:@"%@.%@",initFile,type];
    NSString *destinationPath = [fileDirectory stringByAppendingPathComponent:allFileName];
    NSString *sourecePath = [[NSBundle mainBundle] pathForResource:initFile ofType:type];
    
    NSFileManager *fileManeger = [NSFileManager defaultManager];
    if (![fileManeger fileExistsAtPath:destinationPath])
    {
        [fileManeger copyItemAtPath:sourecePath toPath:destinationPath error:nil];
    }
    
}


/**
 * @brief 将文件放在缓存目录下
 */
+ (NSString *)getCachesPathWithFile:(NSString *) file
{
    if (file)
    {
        return [[FileUtil getSandboxCache] stringByAppendingPathComponent:file];
    }
    return nil;
}

/**
 * @brief 将文件放在临时文件夹下
 */
+ (NSString *) getTempPathWithFile:(NSString *) file
{
    if (file)
    {
        return [[FileUtil getSandboxTemp] stringByAppendingPathComponent:file];
    }
    return nil;
}

/**
 * @brief 将文件放在文档目录下
 */
+ (NSString *) getDocumentPathWithFile:(NSString *) file
{
    if (file)
    {
        return [[FileUtil getSandboxDocument] stringByAppendingPathComponent:file];
    }
    return nil;
}

/**
 * @brief 将字典转化为plist,存放路径
 */
+ (void) createPlistFromDictonary:(id) structure  savePath:(NSString *) savePath
{
    NSString *error = nil;
    NSData *plistData = [NSPropertyListSerialization
                         dataFromPropertyList:(id)structure
                         format:NSPropertyListXMLFormat_v1_0
                         errorDescription:&error];
    if (plistData)
    {
        [plistData writeToFile:savePath atomically:YES];
    }
    else
    {
        NSLog(@"%s faild",__FUNCTION__);
    }
}

/**
 * 该路径是否允许备份
 */
+ (BOOL)addSkipBackupAttributeToFile:(NSString *)path
{
    return [[NSURL.alloc initFileURLWithPath:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}

/**
 * 剩余空间
 */
+ (double)availableDiskSpace
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[self getSandboxDocument] error:nil];
    
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}

@end
