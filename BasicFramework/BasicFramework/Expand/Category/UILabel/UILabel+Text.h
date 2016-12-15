//
//  UILabel+Text.h
//  BJL
//
//  Created by txp on 16/5/16.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Text)

/**
 *  @brief 只能填充label宽度，多余部分均等补充空格，item 之间至少一个空格,
 *
 *  @param array string 数组
 */
- (void) setTextWithArray:(NSArray *) array;

/**
 *  @brief 设置文字，下划线
 *
 *  @param string         文字
 *  @param textColor      文字颜色
 *  @param isUnderLine    是否需要下划线
 *  @param underLineColor 下划线颜色
 */
- (void) setAttributedTextWithString:(NSString *) string
                           textColor:(UIColor *) textColor
                         isUnderLine:(BOOL) isUnderLine
                      underLineColor:(UIColor *) underLineColor;

@end
