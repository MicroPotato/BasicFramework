//
//  Common_other.h
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

/**
 *  @brief 其它宏定义
 */
#ifndef Common_other_h
#define Common_other_h


/**
 * @brief 判断是否首次启动
 */
#define FIRST_LAUNCH @"firstLaunch"


/**
 *  @brief 获取当前语言
 */
#define CURRENT_LANGUAGE  ([NSLocale preferredLanguages][0])


/**
 *  @brief Show Alert, brackets is the parameters.       宏定义一个弹窗方法,括号里面是方法的参数
 */
#define SHOW_ALERT   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning." message:nil delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: @"OK"];[alert show];


/**
 * @brief 本地化
 */
#define K_LOCALIZEDSTRING(key) NSLocalizedString(key, nil)


/**
 * @brief 常用的正则表达式
 */
#define REGEX_EXCEPTSPACE  @"\\S+" // 除了空格的其他字符
#define REGEX_NUMBER  @"[0-9]" // 数字
#define REGEX_CHARACTER  @"[a-zA-Z]" // 字母
#define REGEX_CHARACTER_LOWER @"[a-z]" // 小写字母
#define REGEX_CHARACTER_UPPER @"[A-Z]" // 大小字母
#define REGEX_NUMBER_AND_CHARACTER  @"[0-9a-zA-Z]"//字母数字
#define REGEX_NUMBER_AND_CHARACTER_LOWER  @"[0-9a-z_.@]"//数字 小写字母 下划线


/**
 *  @brief 通知中心
 *
 *  @return
 */
#define NOTIFICATION_CENTER [NSNotificationCenter defaultCenter]



#endif /* Common_other_h */
