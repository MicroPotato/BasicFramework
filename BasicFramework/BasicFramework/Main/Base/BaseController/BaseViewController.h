//
//  BaseViewController.h
//  BasicFramework
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 Peng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+LoadDefault.h"
#import "NSObject+CustomDealloc.h"

@interface BaseViewController : UIViewController

@property(nonatomic,assign) CGFloat keyboarHeight;//<! 键盘高度
@property(nonatomic,assign) BOOL backBarTextIsBack;//<! 是否需要创建返回控制器


/**
 *  @brief 添加键盘通知
 */
- (void) addKeyboardNotifications;

/**
 *  @brief 移除键盘通知
 */
- (void) removeKeyboardNotifications;

/**
 *  @brief 键盘已经展示
 *
 *  @param aNotification 通知
 */
- (void) keyboardDidShow:(NSNotification *)aNotification;

/**
 *  @brief 键盘将要展示
 *
 *  @param aNotification 通知
 */
- (void) keyboardWillShow:(NSNotification *)aNotification;

/**
 *  @brief 键盘将要隐藏
 *
 *  @param aNotification 通知
 */
- (void) keyboardWillHide:(NSNotification *)aNotification;


@end
