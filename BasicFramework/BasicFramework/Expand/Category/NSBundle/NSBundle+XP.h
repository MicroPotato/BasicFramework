//
//  NSBundle+XP.h
//  CommonMacro
//
//  Created by wszhg on 16/3/22.
//  Copyright (c) 2016年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSBundle (XP)

@end


//----------------- appIcon -----------------------
@interface NSBundle (AppIcon)

/**
 * 获取app图片名
 **/
- (NSString*)appIconPath;

/**
 * 获取app图片
 **/
- (UIImage*)appIcon;


@end