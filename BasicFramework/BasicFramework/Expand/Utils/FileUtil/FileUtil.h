//
//  FileUtil.h
//  IOS沙盒
//
//  Created by whunf on 14-4-21.
//  Copyright (c) 2014年 hwl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUtil : NSObject

/**
 * @brief 获取沙盒下的主目录
 */
+ (NSString *)getSandboxHome;

/**
 * @brief 获取沙盒下的文档目录
 */
+ (NSString *) getSandboxDocument;

/**
 * @brief 获取沙盒下的缓存目录
 */
+ (NSString *) getSandboxCache;

/**
 * @brief 获取沙盒下的链接目录
 */
+ (NSString *) getSandboxLibary;

/**
 * @brief 获取沙盒下的临时目录
 */
+ (NSString *) getSandboxTemp;

/**
 * @brief 将文件拷贝到沙盒下
 */
+ (void) copyInitFile:(NSString *) initFile
               ofType:(NSString *) type
               toPath:(NSInteger ) pathCode;

/**
 * @brief 将文件放在缓存目录下
 */
+ (NSString *)getCachesPathWithFile:(NSString *) file;

/**
 * @brief 将文件放在临时文件夹下
 */
+ (NSString *) getTempPathWithFile:(NSString *) file;

/**
 * @brief 将文件放在文档目录下
 */
+ (NSString *) getDocumentPathWithFile:(NSString *) file;

/**
 * @brief 将字典转化为plist,存放路径
 */
+ (void) createPlistFromDictonary:(id) structure  savePath:(NSString *) savePath;

/**
 * 该路径是否允许备份
 */
+ (BOOL)addSkipBackupAttributeToFile:(NSString *)path;

/**
 * 剩余空间
 */
+ (double)availableDiskSpace;

@end
