//
//  UIImage+YT.h
//  新浪微博
//
//  Created by Whunf on 14-5-18.
//  Copyright (c) 2014年 TXP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XP)
/**
 * @brief 加载全屏图片
 */
+ (UIImage *)fullScreenImage:(NSString *)imageName;

/**
 * @brief 可以自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)imgName;

/**
 * @brief 将view转换为图片
 */
- (UIImage *)initWithimageFromView:(UIView *)view;

/**
 * @brief 将view转换为图片
 */
+ (UIImage *)imageFromView:(UIView *)view;

/**
 * @brief 修改图片尺寸
 */
- (UIImage *)initWithImage:(UIImage *)image scaledToSize:(CGSize) newSize;

/**
 * @brief 修改图片尺寸
 */
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize) newSize;

/**
 * @brief 根据颜色创建图片
 */
+ (UIImage *) imageWithColor:(UIColor *) color size:(CGSize)size;

/**
 * @brief 灰度图片
 */
- (UIImage *) grayImage;

@end
