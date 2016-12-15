//
//  NSMutableDictionary+SafeSetObject.h
//  BasicFramework
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 Peng. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @brief 安全添加对象
 */
@interface NSMutableDictionary (SafeSetObject)

/**
 *  @brief 安全添加对象
 *
 *  @param anObject 对象
 *  @param aKey     键
 */
- (void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end
