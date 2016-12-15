//
//  NSBundle+XP.m
//  CommonMacro
//
//  Created by wszhg on 16/3/22.
//  Copyright (c) 2016年 JiuMu. All rights reserved.
//

#import "NSBundle+XP.h"

@implementation NSBundle (XP)

@end


//----------------- appIcon -----------------------
@implementation NSBundle (AppIcon)
/**
 * 获取app图片名
 **/
- (NSString*)appIconPath
{
    NSString* iconFilename = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIconFile"] ;
    NSString* iconBasename = [iconFilename stringByDeletingPathExtension] ;
    NSString* iconExtension = [iconFilename pathExtension] ;
    return [[NSBundle mainBundle] pathForResource:iconBasename
                                           ofType:iconExtension] ;
}

/**
 * 获取app图片
 **/
- (UIImage*)appIcon
{
    return [[UIImage alloc] initWithContentsOfFile:[self appIconPath]];
}

@end