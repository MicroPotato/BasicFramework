//
//  Common_device.h
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

/**
 *  @brief 设备相关的宏
 */

#ifndef Common_device_h
#define Common_device_h


/**
 *  @brief 系统版本 system version
 */

//等于当前某一版本
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
//大于当前版本
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
//大于或者等于当前版本
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
//小于当前版本
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
//小于或等于当前版本
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


//当前软件版本
#define GET_CURRENT_VERSION ([[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"])
//当前系统版本
#define IOS_VERSION [[UIDevice currentDevice].systemVersion doubleValue]
// IOS6的系统
#define ISIOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
// IOS7的系统
#define ISIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
// IOS8的系统
#define ISIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
// IOS9的系统
#define ISIOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
// IOS10的系统
#define ISIOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
//检查系统版本
//等于某一个版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
//大于某一个版本
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
//大于或者等于某一个版本
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
//小于某一个版本
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
//小于或者等于某一个版本
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)



/**
 *  @brief 机型识别，硬件
 */
#define CURRENT_DEVICE_iPad   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define CURRENT_DEVICE_iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define CURRENT_DEVICE_iPod   [[[UIDevice currentDevice] model] isEqual:@"iPod touch"]
/** 设备是否为iPhone 4/4S 分辨率320x480，像素640x960，@2x */
#define IS_iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
/** 设备是否为iPhone 5C/5/5S 分辨率320x568，像素640x1136，@2x */
#define IS_iPhone5   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
/** 设备是否为iPhone 6 分辨率375x667，像素750x1334，@2x */
#define IS_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)
/** 设备是否为iPhone 6 Plus 分辨率414x736，像素1242x2208，@3x */
#define IS_iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)





/**
 * @brief 屏幕模式
 */
//横屏
#define INTERFACE_Portrait self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown
#define UIInterfaceOrientationIsPortrait(orientation)  ((orientation) == UIInterfaceOrientationPortrait || (orientation) == UIInterfaceOrientationPortraitUpsideDown)
//竖屏
#define INTERFACE_Landscape self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight
#define UIInterfaceOrientationIsLandscape(orientation) ((orientation) == UIInterfaceOrientationLandscapeLeft || (orientation) == UIInterfaceOrientationLandscapeRight)



/**
 * @brief 常见的高度和宽度
 */
// 屏幕尺寸
#define SCREENT_RECT [[UIScreen mainScreen] bounds]
//屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//底部tabbar 高度
#define kTabbarHeight       49
//搜索高度
#define kSearchBarHeight    45
//状态栏高度
#define kStatusBarHeight    20
//导航栏高度
#define kNavigationHeight   44
//屏幕宽度
#define kScreenWidth        [UIScreen mainScreen].applicationFrame.size.width
//应用程序高度 不包括状态栏
#define kScreenHeight       [UIScreen mainScreen].applicationFrame.size.height
//屏幕高度
#define kAllHeight          ([UIScreen mainScreen].applicationFrame.size.height + 20.0)
//除去导航栏和状态栏的高度
#define kBodyHeight         ([UIScreen mainScreen].applicationFrame.size.height - 44.0)
#define SCREEN_POINT (float)SCREEN_WIDTH/320.f
#define SCREEN_H_POINT (float)SCREEN_HEIGHT/480.f


/**
 *  @brief 真机
 */
#if TARGET_OS_IPHONE
//iPhone Device
#endif

/**
 *  @brief 模拟器
 */
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif








#endif /* Common_device_h */
