//
//  NSMutableArray+SafeAddObject.m
//  BasicFramework
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 Peng. All rights reserved.
//

#import "NSMutableArray+SafeAddObject.h"

@implementation NSMutableArray (SafeAddObject)

/**
 *  @brief 安全添加对象
 *
 *  @param anObject 对象
 */
- (void)safeAddObject:(id)anObject
{
    if (anObject) {
        [self addObject:anObject];
    }
}

@end
