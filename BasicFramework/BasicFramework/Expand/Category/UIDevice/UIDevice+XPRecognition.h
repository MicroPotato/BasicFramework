//
//  UIDevice+XPRecognition.h
//  JudgeDeviceType
//
//  Created by txp on 16/1/11.
//  Copyright (c) 2016年 JiuMu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (XPRecognition)

/**
 * @brief 高级API 获取设备 返回的 iPhone iPod iPad,适合要求不高的
 */

- (NSString *) deviceTypeWithModel;

/**
 * @brief @brief C 语言，底层方法
 */
- (NSString *) deviceTypeWithLinuxC;

/**
 * @brief sys/utsname.h 获取底层设备类型
 */
- (NSString *) deviceTypeWithUtsname;


@end
