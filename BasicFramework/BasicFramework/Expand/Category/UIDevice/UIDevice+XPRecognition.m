//
//  UIDevice+XPRecognition.m
//  JudgeDeviceType
//
//  Created by txp on 16/1/11.
//  Copyright (c) 2016年 JiuMu. All rights reserved.
//

#import "UIDevice+XPRecognition.h"
#import <sys/utsname.h>
#import <sys/sysctl.h>

@implementation UIDevice (XPRecognition)
/**
 * @brief 高级API 获取设备 返回的 iPhone iPod iPad,适合要求不高的
 */

- (NSString *) deviceTypeWithModel
{
    return [[UIDevice currentDevice] model];
}

/**
 * @brief C 语言，底层方法
 */
- (NSString *) deviceTypeWithLinuxC
{
    NSString *correspondVersion = [self getDeviceVersionInfo];
    return [self modelNameForModelIdentifier:correspondVersion];
}

- (NSString *) getDeviceVersionInfo
{
    size_t size;
    // get the length of machine name
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    //get machine name
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithFormat:@"%s",machine];
    free(machine);
    return platform;
}

/**
 * @brief sys/utsname.h 获取底层设备类型
 */
- (NSString *) deviceTypeWithUtsname
{
    NSString *correspondVersion = [self getDeviceVersionInfoWithUtsname];
    return [self modelNameForModelIdentifier:correspondVersion];
}

- (NSString *) getDeviceVersionInfoWithUtsname
{
    struct utsname systenInfo;
    uname(&systenInfo);
    NSString *platForm = [NSString stringWithFormat:@"%s",systenInfo.machine];
    return platForm;
}

/**
 *  @brief 根据标识，识别类型
 *
 *  @param modelIdentifier 标识
 *
 *  @return 设备类型
 */
- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier
{
    //------ Simulator
    if ([modelIdentifier isEqualToString:@"i386"])
        return@"Simulator";
    
    if ([modelIdentifier isEqualToString:@"x86_64"])
        return @"Simulator";
    
    // -----iPhone http://theiphonewiki.com/wiki/IPhone
    if ([modelIdentifier isEqualToString:@"iPhone1,1"])
        return@"iPhone 1";
    
    if ([modelIdentifier isEqualToString:@"iPhone1,2"])
        return@"iPhone 3";
    
    if ([modelIdentifier isEqualToString:@"iPhone2,1"])
        return@"iPhone 3S";
    
    if ([modelIdentifier isEqualToString:@"iPhone3,1"] ||
        [modelIdentifier isEqualToString:@"iPhone3,2"])
        return@"iPhone 4";
    
    if ([modelIdentifier isEqualToString:@"iPhone4,1"])
        return@"iPhone 4S";
    
    if ([modelIdentifier isEqualToString:@"iPhone5,1"] ||
        [modelIdentifier isEqualToString:@"iPhone5,2"])
        return @"iPhone 5";
    
    if ([modelIdentifier isEqualToString:@"iPhone5,3"] ||
        [modelIdentifier isEqualToString:@"iPhone5,4"])
        return @"iPhone 5C";
    
    if ([modelIdentifier isEqualToString:@"iPhone6,1"] ||
        [modelIdentifier isEqualToString:@"iPhone6,2"])
        return @"iPhone 5S";
    
    if ([modelIdentifier isEqualToString:@"iPhone7,1"])
        return @"iPhone 6 Plus";
    
    if ([modelIdentifier isEqualToString:@"iPhone7,2"])
        return @"iPhone 6";
    
    if ([modelIdentifier isEqualToString:@"iPhone8,1"])
        return @"iPhone 6s";
    
    if ([modelIdentifier isEqualToString:@"iPhone8,2"])
        return @"iPhone 6s Plus";
    
    if ([modelIdentifier isEqualToString:@"iPhone8,4"])
        return @"iPhone SE";
    
    //-----iPod http://theiphonewiki.com/wiki/IPod
    if ([modelIdentifier isEqualToString:@"iPod1,1"])
        return@"iPod Touch 1";
    
    if ([modelIdentifier isEqualToString:@"iPod2,1"])
        return@"iPod Touch 2";
    
    if ([modelIdentifier isEqualToString:@"iPod3,1"])
        return@"iPod Touch 3";
    
    if ([modelIdentifier isEqualToString:@"iPod4,1"])
        return@"iPod Touch 4";
    
    if ([modelIdentifier isEqualToString:@"iPod5,1"])
        return@"iPod Touch 5";
    
    if ([modelIdentifier isEqualToString:@"iPad1,1"])
        return@"iPad 1";
    
    
    //------iPad http://theiphonewiki.com/wiki/IPad
    
    if ([modelIdentifier isEqualToString:@"iPad1,1"])
        return @"iPad 1G";
    
    if ([modelIdentifier isEqualToString:@"iPad2,1"])
        return @"iPad 2 (WiFi)";
    
    if ([modelIdentifier isEqualToString:@"iPad2,2"])
        return @"iPad 2 (GSM)";
    
    if ([modelIdentifier isEqualToString:@"iPad2,3"])
        return @"iPad 2 (CDMA)";
    
    if ([modelIdentifier isEqualToString:@"iPad2,4"])
        return @"iPad 2 (Rev A)";
    
    if ([modelIdentifier isEqualToString:@"iPad3,1"])
        return @"iPad 3 (WiFi)";
    
    if ([modelIdentifier isEqualToString:@"iPad3,2"])
        return @"iPad 3 (GSM)";
    
    if ([modelIdentifier isEqualToString:@"iPad3,3"])
        return @"iPad 3 (Global)";
    
    if ([modelIdentifier isEqualToString:@"iPad3,4"])
        return @"iPad 4 (WiFi)";
    
    if ([modelIdentifier isEqualToString:@"iPad3,5"])
        return @"iPad 4 (GSM)";
    
    if ([modelIdentifier isEqualToString:@"iPad3,6"])
        return @"iPad 4 (Global)";
    
    if ([modelIdentifier isEqualToString:@"iPad4,1"])
        return @"iPad Air (WiFi)";
    
    if ([modelIdentifier isEqualToString:@"iPad4,2"])
        return @"iPad Air (Cellular)";
    
    
    // iPad Mini http://theiphonewiki.com/wiki/IPad_mini
    
    if ([modelIdentifier isEqualToString:@"iPad2,5"])
        return @"iPad mini 1G (WiFi)";
    
    if ([modelIdentifier isEqualToString:@"iPad2,6"])
        return @"iPad mini 1G (GSM)";
    
    if ([modelIdentifier isEqualToString:@"iPad2,7"])
        return @"iPad mini 1G (Global)";
    
    if ([modelIdentifier isEqualToString:@"iPad4,4"])
        return @"iPad mini 2G (WiFi)";
    
    if ([modelIdentifier isEqualToString:@"iPad4,5"])
        return @"iPad mini 2G (Cellular)";
    
    if ([modelIdentifier isEqualToString:@"iPad4,6"])
        return @"iPad mini 2";
    
    if ([modelIdentifier isEqualToString:@"iPad4,7"])
        return @"iPad mini 3";
    
    if ([modelIdentifier isEqualToString:@"iPad4,8"])
        return @"iPad mini 3";
    
    if ([modelIdentifier isEqualToString:@"iPad4,9"])
        return @"iPad mini 3";
    
    if ([modelIdentifier isEqualToString:@"iPad5,3"])
        return @"iPad air 2";
    
    if ([modelIdentifier isEqualToString:@"iPad5,4"])
        return @"iPad air 2";
    //    if ([modelIdentifier isEqualToString:@"iPad2,1"] ||
    //        [modelIdentifier isEqualToString:@"iPad2,2"] ||
    //        [modelIdentifier isEqualToString:@"iPad2,3"] ||
    //        [modelIdentifier isEqualToString:@"iPad2,4"])
    //        return@"iPad 2";
    //
    //    if ([modelIdentifier isEqualToString:@"iPad2,5"] ||
    //        [modelIdentifier isEqualToString:@"iPad2,6"] ||
    //        [modelIdentifier isEqualToString:@"iPad2,7"] )
    //        return @"iPad Mini";
    //
    //    if ([modelIdentifier isEqualToString:@"iPad3,1"] ||
    //        [modelIdentifier isEqualToString:@"iPad3,2"] ||
    //        [modelIdentifier isEqualToString:@"iPad3,3"] ||
    //        [modelIdentifier isEqualToString:@"iPad3,4"] ||
    //        [modelIdentifier isEqualToString:@"iPad3,5"] ||
    //        [modelIdentifier isEqualToString:@"iPad3,6"])
    //        return @"iPad 3";
    
    return modelIdentifier;
}

@end
