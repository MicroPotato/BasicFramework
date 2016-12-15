//
//  InternationalControl.h
//  CommonMacro
//
//  Created by txp on 15/11/2.
//  Copyright (c) 2015年 JiuMu. All rights reserved.
//
// 程序内部控制语言

#import <Foundation/Foundation.h>
#import "Common_singleton.h"
#import <UIKit/UIKit.h>

@interface InternationalControl : NSObject
@property (nonatomic, copy) NSString *currentLanguage;//当前语言
@property (nonatomic, strong) NSBundle *languageBundle;//

/**
 * @brief 单例
 */
singleton_interface(InternationalControl);

/**
 * @brief 获取字符串
 */
- (NSString *) locatizedStringForkey:(NSString *) stringKey;

/**
 * @brief 获取storyboard
 */
- (UIStoryboard *) locatizedStoryboardWithName:(NSString *) storyboardName;

/**
 * @brief 获取xib
 */
- (UINib *) locatizedNibWithName:(NSString *) nibNameOrNil;


@end
