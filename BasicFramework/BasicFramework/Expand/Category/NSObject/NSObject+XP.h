//
//  NSObject+XP.h
//  CommonMacro
//
//  Created by txp on 16/3/30.
//  Copyright (c) 2016年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (XP)

@end


@interface NSObject (Runtime)
/**
 *  @brief 检测对象是否包涵该属性
 *  @prama instance 实例对象
 *  @prama verifyProperty 验证的属性
 *  @return
 */
- (BOOL) checkIsExistPropertyWithInstance:(id) instance verifyProperty:(NSString *) verifyProperty;

/**
 *  @brief 获取一个实例的属性名字列表
 *  @prama instance 实例对象
 *  @return 该实例所有的属性（NSString）
 */
- (NSArray *) propertyListWithInstance:(id) instance;

/**
 *  @brief 获取一个实例的方法列表
 *  @prama instance 实例对象
 *  @return 该实例的方法名（NSString）
 */
- (NSArray *) methodListWithInstance:(id) instance;

/**
 *  @brief 检测对象是否包涵该成员变量
 *  @prama instance 实例对象
 *  @prama verifyIvar 验证的成员变量
 *  @return
 */
- (BOOL) checkIsExistIvarWithInstance:(id) instance verifyIvar:(NSString *) verifyIvar;

/**
 *  @brief 获取一个实例成员变量名字列表
 *  @prama instance 实例对象
 *  @return 该实例所有的成员变量（NSString）
 */
- (NSArray *) ivarListWithInstance:(id) instance;

/**
 *  @brief 获取一个实例协议列表
 *  @prama instance 实例对象
 *  @return 该实例所有的协议（NSString）
 */
- (NSArray *) protocolListWithInstance:(id) instance;

/**
 *  @brief 获取view的所在父ViewController
 *
 *  @param viewObj view
 *
 *  @return view 所在的 viewController
 */
+ (UIViewController*)viewControllerWithViewObj:(UIView *)viewObj;


@end