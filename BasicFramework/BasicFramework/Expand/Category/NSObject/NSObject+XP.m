//
//  NSObject+XP.m
//  CommonMacro
//
//  Created by txp on 16/3/30.
//  Copyright (c) 2016年 JiuMu. All rights reserved.
//

#import "NSObject+XP.h"
#import <objc/runtime.h>

@implementation NSObject (XP)

@end


@implementation NSObject (Runtime)
/**
 *  @brief 检测对象是否包涵该属性
 *  @prama instance 实例对象
 *  @prama verifyProperty 验证的属性
 *  @return
 */
- (BOOL) checkIsExistPropertyWithInstance:(id) instance verifyProperty:(NSString *) verifyProperty
{
    unsigned int outCount, i;
    BOOL isExist;
    objc_property_t *propertyList = class_copyPropertyList([instance class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t thisProperty = propertyList[i];
        NSString *thisPropertyName = [NSString stringWithUTF8String:property_getName(thisProperty)];
        if ([thisPropertyName isEqualToString:verifyProperty]) {
            isExist = YES;
            break;
        }
    }
    free(propertyList);
    return isExist;
}

/**
 *  @brief 获取一个实例的属性名字列表
 *  @prama @prama instance 实例对象
 *  @return 该实例所有的属性（NSString）
 */
- (NSArray *) propertyListWithInstance:(id) instance
{
    unsigned int outCount, i;
    objc_property_t *propertyList = class_copyPropertyList([instance class], &outCount);
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:outCount];
    for (i = 0; i < outCount; i++) {
        objc_property_t thisProperty = propertyList[i];
        NSString *thisPropertyName = [NSString stringWithUTF8String:property_getName(thisProperty)];
        [mArray addObject:thisPropertyName];
    }
    free(propertyList);
    return [NSArray arrayWithArray:mArray];
}

/**
 *  @brief 获取一个实例的方法列表
 *  @prama instance 实例对象
 *  @return 该实例的方法名（NSString）
 */
- (NSArray *) methodListWithInstance:(id) instance
{
    unsigned int outCount, i;
    Method *methodList = class_copyMethodList([instance class], &outCount);
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:outCount];
    for (i = 0; i < outCount; i++) {
        Method thisMethod = methodList[i];
        SEL sel = method_getName(thisMethod);
        const char *name = sel_getName(sel);
        NSString *methodName = [NSString stringWithUTF8String:name];
        [mArray addObject:methodName];
    }
    free(methodList);
    return [NSArray arrayWithArray:mArray];
}

/**
 *  @brief 检测对象是否包涵该属性
 *  @prama instance 实例对象
 *  @prama verifyIvar 验证的成员变量
 *  @return
 */
- (BOOL) checkIsExistIvarWithInstance:(id) instance verifyIvar:(NSString *) verifyIvar
{
    unsigned int outCount, i;
    BOOL isExit;
    Ivar *ivarList = class_copyIvarList([instance class], &outCount);
    for (i = 0; i < outCount; i++) {
        Ivar thisIvar = ivarList[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        if ([ivarName isEqualToString:verifyIvar]) {
            isExit = YES;
            break;
        }
    }
    free(ivarList);
    return isExit;
}

/**
 *  @brief 获取一个实例的属性名字列表
 *  @prama instance 实例对象
 *  @return 该实例所有的成员变量（NSString）
 */
- (NSArray *) ivarListWithInstance:(id) instance
{
    unsigned int outCount, i;
    Ivar *ivarList = class_copyIvarList([instance class], &outCount);
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:outCount];
    for (i = 0; i < outCount; i++) {
        Ivar thisIvar = ivarList[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        [mArray addObject:ivarName];
    }
    free(ivarList);
    return [NSArray arrayWithArray:mArray];
}

/**
 *  @brief 获取一个实例协议列表
 *  @prama instance 实例对象
 *  @return 该实例所有的协议（NSString）
 */
- (NSArray *) protocolListWithInstance:(id) instance
{
    unsigned int outCount, i;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([instance class], &outCount);
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:outCount];
    for (i = 0; i < outCount; i++) {
        Protocol *thisProtocol = protocolList[i];
        NSString *protocolName = [NSString stringWithUTF8String:protocol_getName(thisProtocol)];
        [mArray addObject:protocolName];
    }
    return [NSArray arrayWithArray:mArray];
}

/**
 *  @brief 获取view的所在父ViewController
 *
 *  @param viewObj view
 *
 *  @return view 所在的 viewController
 */
+ (UIViewController*)viewControllerWithViewObj:(UIView *)viewObj
{
    for (UIView* next = [viewObj superview]; next; next =
         next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController
                                          class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end