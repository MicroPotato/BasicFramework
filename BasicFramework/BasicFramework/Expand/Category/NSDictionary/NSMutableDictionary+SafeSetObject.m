//
//  NSMutableDictionary+SafeSetObject.m
//  BasicFramework
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 Peng. All rights reserved.
//

#import "NSMutableDictionary+SafeSetObject.h"

@implementation NSMutableDictionary (SafeSetObject)

/**
 *  @brief 安全添加对象
 *
 *  @param anObject 对象
 *  @param aKey     键
 */
- (void)setSafeObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}

@end
