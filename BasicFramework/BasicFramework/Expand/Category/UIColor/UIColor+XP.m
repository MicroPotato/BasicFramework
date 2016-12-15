//
//  UIColor+XP.m
//  CommonMacro
//
//  Created by txp on 16/5/5.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import "UIColor+XP.h"

@implementation UIColor (XP)

@end

@implementation UIColor (RGBValues)

- (CGFloat)red {
    const CGFloat* components = CGColorGetComponents(self.CGColor);
    return components[0];
}

- (CGFloat)green {
    const CGFloat* components = CGColorGetComponents(self.CGColor);
    return components[1];
}

- (CGFloat)blue {
    const CGFloat* components = CGColorGetComponents(self.CGColor);
    return components[2];
}

- (CGFloat)alpha {
    return CGColorGetAlpha(self.CGColor);
}

- (BOOL)isClearColor {
    return [self isEqual:[UIColor clearColor]];
}

- (BOOL)isLighterColor {
    const CGFloat* components = CGColorGetComponents(self.CGColor);
    return (components[0]+components[1]+components[2])/3 >= 0.5;
}

- (UIColor *)lighterColor {
    if ([self isEqual:[UIColor whiteColor]]) return [UIColor colorWithWhite:0.99 alpha:1.0];
    if ([self isEqual:[UIColor blackColor]]) return [UIColor colorWithWhite:0.01 alpha:1.0];
    float hue, saturation, brightness, alpha;
    if ([self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha])
        return [UIColor colorWithHue:hue
                          saturation:saturation
                          brightness:MIN(brightness * 1.3, 1.0)
                               alpha:alpha];
    return nil;
}

- (UIColor *)darkerColor {
    if ([self isEqual:[UIColor whiteColor]]) return [UIColor colorWithWhite:0.99 alpha:1.0];
    if ([self isEqual:[UIColor blackColor]]) return [UIColor colorWithWhite:0.01 alpha:1.0];
    float hue, saturation, brightness, alpha;
    if ([self getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha])
        return [UIColor colorWithHue:hue
                          saturation:saturation
                          brightness:brightness * 0.75
                               alpha:alpha];
    return nil;
}

@end