//
//  UIBarButtonItem+YT.h
//  新浪微博
//
//  Created by Whunf on 14-5-19.
//  Copyright (c) 2014年 TXP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XP)
/**
 * @brief 普通状态和高亮状态的按钮图标
 * @prama  icon 普通图片
 * @prama  highIcon 高亮图片
 * @prama  target 监听对象
 * @prama  action 方法
 * return
 */
- (id)initWithIcon:(NSString *) icon
          highIcon:(NSString *)highIcon
            target:(id)target
            action:(SEL)action;

/**
 * @brief 普通状态和高亮状态的按钮图标
 * @prama  icon 普通图片
 * @prama  highIcon 高亮图片
 * @prama  target 监听对象
 * @prama  action 方法
 * return
 */
+ (id)barButtonItemWithIcon:(NSString *)icon
                   highIcon:(NSString *)highIcon
                     target:(id)target
                     action:(SEL)action;


/**
 * @brief 文字按钮
 * @prama  title 普通图片
 * @prama  rect 高亮图片
 * @prama  font 字体
 * @prama  target 监听对象
 * @prama  action 方法
 * return
 */
- (id) initWithTitle:(NSString *)title
               frame:(CGRect) rect
            withFont:(UIFont *)font
              target:(id) target
              action:(SEL)action;

/**
 * @brief 文字按钮
 * @prama  title 普通图片
 * @prama  rect 高亮图片
 * @prama  font 字体
 * @prama  target 监听对象
 * @prama  action 方法
 * return
 */
+ (id) barButtonItemWithTitle:(NSString *)title
                        frame:(CGRect) rect
                     withFont:(UIFont *)font
                       target:(id) target
                       action:(SEL)action;

/**
 * @brief  背景普通状态和高亮状态  按钮常态
 * @prama  normalImage 普通背景图片
 * @prama  highImage 高亮背景图片
 * @prama  icon 图片
 * @prama  target 监听对象
 * @prama  action 方法
 * return
 */
- (id) initWithBackground:(NSString *)normalImage
                highImage:(NSString *)highImage
                 withIcon:(NSString *)icon
                   target:(id)target
                   action:(SEL)action;

/**
 * @brief  背景普通状态和高亮状态  按钮常态
 * @prama  normalImage 普通背景图片
 * @prama  highImage 高亮背景图片
 * @prama  icon 图片
 * @prama  target 监听对象
 * @prama  action 方法
 * return
 */
+ (id) barButtonItemWithBackground:(NSString *)normalImage
                         highImage:(NSString *)highImage
                          withIcon:(NSString *)icon
                            target:(id)target
                            action:(SEL) action;

@end
