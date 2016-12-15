//
//  NSDate+XP.h
//  CommonMacro
//
//  Created by txp on 16/3/23.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XP)
/**
 *@brief 是否为今天
 */
- (BOOL)isToday;

/**
 *@brief 是否为昨天
 */
- (BOOL)isYesterday;

/**
 *@brief 是否为今年
 */
- (BOOL)isThisYear;

/**
 *@brief 获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;

@end
