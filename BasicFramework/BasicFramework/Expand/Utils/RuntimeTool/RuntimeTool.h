//
//  RuntimeTool.h
//  Learn_runtime
//
//  Created by txp on 16/5/6.
//  Copyright © 2016年 Peng. All rights reserved.
//

//-------------- 利用runtime 只做的工具----------------------

#import <Foundation/Foundation.h>
///成员对象模型
@interface IvarModel : NSObject
@property (nonatomic, copy) NSString *ivarName;//成员变量名字
@property (nonatomic, copy) NSString *ivarDataType;//成员变量数据类型

- (void)setIvarName:(NSString *)ivarName ivarDataType:(NSString *) ivarDataType;
- (instancetype)initWithIvarName:(NSString *)ivarName ivarDataType:(NSString *) ivarDataType;
+ (instancetype) ivarModelWithIvarName:(NSString *)ivarName ivarDataType:(NSString *) ivarDataType;

@end

///----------------------------------------------------------------------------------------------

@interface PropertyModel : NSObject
@property (nonatomic, copy) NSString *propertyName;//属性名字
@property (nonatomic, copy) NSString *propertyAttributes;//相关列表值，包括类型，赋值方式，原子性T@"NSString",C,N,V_address

- (void) setPropertyName:(NSString *)propertyName propertyAttributes:(NSString *) propertyAttributes;

- (instancetype) initWithPropertyName:(NSString *)propertyName propertyAttributes:(NSString *) propertyAttributes;

+ (instancetype) propertyWithPropertyName:(NSString *)propertyName propertyAttributes:(NSString *) propertyAttributes;

@end

///----------------------------------------------------------------------------------------------
@interface MethodModel : NSObject
@property (nonatomic, copy) NSString *methodName;//方法名字
@property (nonatomic, copy) NSString *methodType;//

- (void)setMethodName:(NSString *)methodName methodType:(NSString *) methodType;
- (instancetype)initWithMethodName:(NSString *)methodName methodType:(NSString *) methodType;

+ (instancetype) methodModeWithMethodName:(NSString *)methodName methodType:(NSString *) methodType;

@end


///----------------------------------------------------------------------------------------------
@interface ProtocolModel : NSObject
@property (nonatomic, copy) NSString *protocolName;//协议名字

- (instancetype)initWithProtocolName:(NSString *)protocolName;
+ (instancetype) protocolWithProtocolName:(NSString *)protocolName;

@end


///----------------------------------------------------------------------------------------------

@interface RuntimeTool : NSObject
/**
 * @brief 获取一个类的所有的成员变量
 * @prama aClass 类
 * return IvarModel对象数组
 */
+ (NSArray <IvarModel *>*) ivarsWithClass:(Class) aClass;

/**
 * @brief 获取一个类的所有的属性
 * @prama aClass 类
 * return PropertyModel对象数组
 */
+ (NSArray <PropertyModel *>*) propertysWithClass:(Class) aClass;

/**
 * @brief 获取一个类的所有的方法
 * @prama aClass 类
 * return MethodModel对象数组
 */
+ (NSArray <MethodModel *>*) methodsWithClass:(Class) aClass;

/**
 * @brief 获取一个类的所有的协议
 * @prama aClass 类
 * return ProtocolModel对象数组
 */
+ (NSArray <ProtocolModel *>*) protocolsWithClass:(Class) aClass;



@end

