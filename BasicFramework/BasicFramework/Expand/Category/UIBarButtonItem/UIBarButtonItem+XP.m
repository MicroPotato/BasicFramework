//
//  UIBarButtonItem+YT.m
//  新浪微博
//
//  Created by Whunf on 14-5-19.
//  Copyright (c) 2014年 TXP. All rights reserved.
//

#import "UIBarButtonItem+XP.h"

@implementation UIBarButtonItem (XP)

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
            action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *lNormalImage = [UIImage imageNamed:icon];
    [button setImage:lNormalImage forState:UIControlStateNormal];
    [button  setImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
    
    button.frame = (CGRect){CGPointZero,lNormalImage.size};
    [button  addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [self initWithCustomView:button];
}

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
                     action:(SEL)action
{
    return [[self alloc] initWithIcon:icon
                             highIcon:highIcon
                               target:target
                               action:action];
}


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
              action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [self initWithCustomView:button];
}

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
                       action:(SEL)action
{
    return [[self alloc] initWithTitle:title
                                 frame:rect
                              withFont:font
                                target:target
                                action:action];
}

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
                   action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    UIImage *image = [UIImage imageNamed:normalImage];
    button.frame =  (CGRect){CGPointZero,image.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [self initWithCustomView:button];
}

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
                            action:(SEL) action
{
    return [[self alloc] initWithBackground:normalImage
                                  highImage:highImage
                                   withIcon:icon
                                     target:target
                                     action:action];
}

@end
