//
//  UIColor+XP.h
//  CommonMacro
//
//  Created by txp on 16/5/5.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XP)

@end

@interface UIColor (RGBValues)
- (CGFloat)red;
- (CGFloat)green;
- (CGFloat)blue;
- (CGFloat)alpha;

- (UIColor *)darkerColor;
- (UIColor *)lighterColor;
- (BOOL)isLighterColor;
- (BOOL)isClearColor;

@end