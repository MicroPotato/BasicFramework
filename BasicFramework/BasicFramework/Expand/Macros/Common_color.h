//
//  Common_color.h
//  CommonMacro
//
//  Created by txp on 15/11/2.
//  Copyright (c) 2015年 JiuMu. All rights reserved.
//
// 常用颜色的宏定义


#ifndef CommonMacro_Common_color_h
#define CommonMacro_Common_color_h

/**
 * @brief 颜色
 * r 红
 * g 绿
 * b 蓝
 * a 透明度
 */
#define COLORA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define COLOR(r,g,b) COLORA((r),(g),(b),1)

/**
 * rgb颜色转换（16进制->10进制）
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define kClearColor [UIColor clearColor]
#define COLOR_BLUE_             UIColorFromRGB(0x41CEF2)
#define COLOR_GRAY_             UIColorFromRGB(0xababab) //171
#define COLOR_333               UIColorFromRGB(0x333333) //51
#define COLOR_666               UIColorFromRGB(0x666666) //102
#define COLOR_888               UIColorFromRGB(0x888888) //136
#define COLOR_999               UIColorFromRGB(0x999999) //153
#define COLOR_PLACEHOLD_        UIColorFromRGB(0xc5c5c5) //197
#define COLOR_RED_              UIColorFromRGB(0xff5400) //红色
#define COLOR_GREEN_            UIColorFromRGB(0x31d8ab)//绿色
#define COLOR_YELLOW_           UIColorFromRGB(0xffa200)//黄色
#define COLOR_SEPARATE_LINE     UIColorFromRGB(0xC8C8C8)//200
#define COLOR_LIGHTGRAY         COLOR(200, 200, 200, 0.4)//淡灰色

#endif
