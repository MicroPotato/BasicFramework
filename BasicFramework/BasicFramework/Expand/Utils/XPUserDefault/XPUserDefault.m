//
//  XPUserDefault.m
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import "XPUserDefault.h"
#import "NSObject+LoadDefault.h"
#import "FastCoder.h"

@implementation XPUserDefault

#pragma mark - lifecycle

singleton_implementation(XPUserDefault);

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadDefault];
    }
    return self;
}

#pragma mark - function
- (void)loadDefault
{

}

/**
 *  @brief 存储对象
 *
 *  @param value 值
 *  @param key   键
 *
 *  @return YES = 成功， NO = 失败
 */
- (BOOL) storeValue:(id) value withKey:(NSString *) key
{
    NSParameterAssert(value);
    NSParameterAssert(key);
    NSData* data = [FastCoder dataWithRootObject:value];
    if (data) {
        [[NSUserDefaults standardUserDefaults]setObject:data forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
        return YES;
    }
    return NO;
}

/**
 *  @brief 取出对象
 *
 *  @param key 键
 *
 *  @return 对象
 */
- (id) valueWithKey:(NSString *) key
{
    NSParameterAssert(key);
    NSData* data = [[NSUserDefaults standardUserDefaults]valueForKey:key];
    return [FastCoder objectWithData:data];
}

/**
 *  @brief 移除对象
 *
 *  @param value 值
 *  @param key   键
 *
 *  @return YES = 成功， NO = 失败
 */
- (BOOL) removeValue:(id) value withKey:(NSString *) key
{
    NSParameterAssert(key);
    id data = [[NSUserDefaults standardUserDefaults]valueForKey:key];
    if (data) {
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
        return YES;
    }
    return NO;
}

@end
