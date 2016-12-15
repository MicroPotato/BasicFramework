//
//  RuntimeTool.m
//  Learn_runtime
//
//  Created by txp on 16/5/6.
//  Copyright © 2016年 Peng. All rights reserved.
//

#import "RuntimeTool.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <stdint.h>

@implementation IvarModel

- (void)setIvarName:(NSString *)ivarName ivarDataType:(NSString *) ivarDataType
{
    self.ivarName = ivarName;
    self.ivarDataType = ivarDataType;
}

- (instancetype)initWithIvarName:(NSString *)ivarName ivarDataType:(NSString *) ivarDataType
{
    self = [self init];
    if (self) {
        [self setIvarName:ivarName ivarDataType:ivarName];
    }
    return self;
}

+ (instancetype) ivarModelWithIvarName:(NSString *)ivarName ivarDataType:(NSString *) ivarDataType
{
    return [[IvarModel alloc] initWithIvarName:ivarName ivarDataType:ivarDataType];
}

@end

///----------------------------------------------------------------------------------------------

@implementation PropertyModel

- (void) setPropertyName:(NSString *)propertyName propertyAttributes:(NSString *) propertyAttributes
{
    self.propertyName = propertyName;
    self.propertyAttributes = propertyAttributes;
}

- (instancetype) initWithPropertyName:(NSString *)propertyName propertyAttributes:(NSString *) propertyAttributes
{
    self = [self init];
    if (self) {
        [self setPropertyName:propertyName propertyAttributes:propertyAttributes];
    }
    return self;
}

+ (instancetype) propertyWithPropertyName:(NSString *)propertyName propertyAttributes:(NSString *) propertyAttributes
{
    return [[PropertyModel alloc] initWithPropertyName:propertyName propertyAttributes:propertyAttributes];
}

@end

///----------------------------------------------------------------------------------------------

@implementation MethodModel

- (void)setMethodName:(NSString *)methodName methodType:(NSString *) methodType
{
    self.methodName = methodName;
    self.methodType = methodType;
}

- (instancetype)initWithMethodName:(NSString *)methodName methodType:(NSString *) methodType
{
    self = [self init];
    if (self) {
        [self setMethodName:methodName methodType:methodType];
    }
    return self;
}

+ (instancetype) methodModeWithMethodName:(NSString *)methodName methodType:(NSString *) methodType
{
    return [[MethodModel alloc] initWithMethodName:methodName methodType:methodType];
}

@end


///----------------------------------------------------------------------------------------------

@implementation ProtocolModel

- (instancetype)initWithProtocolName:(NSString *)protocolName
{
    self = [self init];
    if (self) {
        self.protocolName = protocolName;
    }
    return self;
}

+ (instancetype) protocolWithProtocolName:(NSString *)protocolName
{
    return [[ProtocolModel alloc] initWithProtocolName:protocolName];
}

@end

///----------------------------------------------------------------------------------------------

@implementation RuntimeTool
/**
 * @brief 获取一个类的所有的成员变量
 * @prama aClass 类
 * return IvarModel对象数组
 */
+ (NSArray <IvarModel *>*) ivarsWithClass:(Class) aClass
{
    unsigned int numIvars;
    Ivar *ivarLists = class_copyIvarList(aClass, &numIvars);
    NSMutableArray *datas = [NSMutableArray arrayWithCapacity:numIvars];
    for (int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivarLists[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(thisIvar)];
        IvarModel *ivarModel = [IvarModel ivarModelWithIvarName:ivarName ivarDataType:ivarType];
        [datas addObject:ivarModel];
    }
    free(ivarLists);
    return [NSArray arrayWithArray:datas];
}

/**
 * @brief 获取一个类的所有的属性
 * @prama aClass 类
 * return PropertyModel对象数组
 */
+ (NSArray <PropertyModel *>*) propertysWithClass:(Class) aClass
{
    unsigned int propertyCount;
    objc_property_t *propertyList = class_copyPropertyList(aClass, &propertyCount);
    NSMutableArray *datas = [NSMutableArray arrayWithCapacity:propertyCount];
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t thisProperty = propertyList[i];
        NSString *property_name = [NSString stringWithUTF8String:property_getName(thisProperty)];
        NSString *property_attributes = [NSString stringWithUTF8String:property_getAttributes(thisProperty)];
        PropertyModel *propertyModel = [PropertyModel propertyWithPropertyName:property_name propertyAttributes:property_attributes];
        [datas addObject:propertyModel];
    }
    free(propertyList);
    return datas;
}

/**
 * @brief 获取一个类的所有的方法
 * @prama aClass 类
 * return MethodModel对象数组
 */
+ (NSArray <MethodModel *>*) methodsWithClass:(Class) aClass
{
    //方法列表
    unsigned int methodCount;
    Method *methods = class_copyMethodList(aClass, &methodCount);
    NSMutableArray *datas = [NSMutableArray arrayWithCapacity:methodCount];
    for (int i = 0; i < methodCount; i++) {
        Method thisMethod = methods[i];
        NSString *method_type = [NSString stringWithUTF8String:method_getTypeEncoding(thisMethod)];
        SEL sel = method_getName(thisMethod);
        const char *name = sel_getName(sel);
        NSString *method_name = [NSString stringWithUTF8String:name];
        MethodModel *methodModel = [MethodModel methodModeWithMethodName:method_name methodType:method_type];
        [datas addObject:methodModel];
    }
    free(methods);
    return datas;
}

/**
 * @brief 获取一个类的所有的协议
 * @prama aClass 类
 * return ProtocolModel对象数组
 */
+ (NSArray <ProtocolModel *>*) protocolsWithClass:(Class) aClass
{
    unsigned int protocolCount;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList(aClass, &protocolCount);
    NSMutableArray *datas = [NSMutableArray arrayWithCapacity:protocolCount];
    for (int i = 0; i < protocolCount; i++) {
        Protocol *thisProtocol = protocolList[i];
        NSString *protocolName = [NSString stringWithUTF8String:protocol_getName(thisProtocol)];
        ProtocolModel *protocolModel = [ProtocolModel protocolWithProtocolName:protocolName];
        [datas addObject:protocolModel];
    }
    free(protocolList);
    return datas;
}


@end
