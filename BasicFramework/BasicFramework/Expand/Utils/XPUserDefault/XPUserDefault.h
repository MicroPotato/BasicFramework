//
//  XPUserDefault.h
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common_singleton.h"

/**
 *  @brief 管理默认字典
 */
@interface XPUserDefault : NSObject

singleton_interface(XPUserDefault);

#pragma mark - function

/**
 *  @brief 存储对象
 *
 *  @param value 值
 *  @param key   键
 *
 *  @return YES = 成功， NO = 失败
 */
- (BOOL) storeValue:(id) value withKey:(NSString *) key;

/**
 *  @brief 取出对象
 *
 *  @param key 键
 *
 *  @return 对象
 */
- (id) valueWithKey:(NSString *) key;

/**
 *  @brief 移除对象
 *
 *  @param value 值
 *  @param key   键
 *
 *  @return YES = 成功， NO = 失败
 */
- (BOOL) removeValue:(id) value withKey:(NSString *) key;


@end
