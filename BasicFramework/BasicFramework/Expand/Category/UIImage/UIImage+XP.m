//
//  UIImage+YT.m
//  新浪微博
//
//  Created by Whunf on 14-5-18.
//  Copyright (c) 2014年 TXP. All rights reserved.
//

#import "UIImage+XP.h"
#import "NSString+XP.h"

//判断是否为iphone5
#define iphone5 (SCREEN_RECT.size.height == 568)

@implementation UIImage (XP)

/**
 * @brief 加载全屏图片
 */
+ (UIImage *)fullScreenImage:(NSString *)imageName
{
    //1.如果是iphone5，对文件名处理
//    if ( iphone5 ) {
//        [imageName fileAppend:@"-568h@2x"];
//    }
    return [self imageNamed:imageName];
}

/**
 * @brief 可以自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)imgName
{
    UIImage *image = [UIImage imageNamed:imgName];
    //左边不拉伸：10
    //右边不拉伸:width - leftCapWidth - 1
    //底部不拉伸:width - topCapWidth - 1
    //顶部不拉伸:10
    //其实拉伸的只有 1x1
    //    bg.image = [bg.image stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    //    bg.image = [bg.image resizableImageWithCapInsets:UIEdgeInsetsMake(5, 10, 5, 10)];
    return  image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch];
}

/**
 * @brief 将view转换为图片
 */
- (UIImage *)initWithimageFromView:(UIView *)view
{
    //设置上下文
    UIGraphicsBeginImageContext(view.bounds.size);
    BOOL hidden = view.hidden;
    view.hidden = NO;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    //渲染当前的上下文
    [view.layer renderInContext:context];
    //从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGContextRestoreGState(context);
    //结束上下文编辑
    UIGraphicsEndImageContext();
    view.hidden = hidden;
    return image;
}

/**
 * @brief 将view转换为图片
 */
+ (UIImage *)imageFromView:(UIView *)view
{
    return [[UIImage alloc]initWithimageFromView:view];
}

/**
 * @brief 修改图片尺寸
 */
- (UIImage *)initWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    //获取上下文
    UIGraphicsBeginImageContext(newSize);
    //将图片绘制按指定的尺寸绘制到上下文中
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    //从上下文中获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //结束上下文编辑
    UIGraphicsEndImageContext();
    
    return newImage;
}

/**
 * @brief 修改图片尺寸
 */
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    return [[UIImage alloc]initWithImage:image scaledToSize:newSize];
}

/**
 * @brief 根据颜色创建图片
 */
+ (UIImage *) imageWithColor:(UIColor *) color
                        size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGContextRestoreGState(context);
    UIGraphicsEndImageContext();
    return image;
}

/**
 * @brief 灰度图片
 */
- (UIImage *) grayImage
{
    int width = self.size.width;
    int height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL)
    {
        return nil;
    }
    
    CGContextDrawImage(context,CGRectMake(0,0, width, height), self.CGImage);
    CGImageRef grayImageRef =CGBitmapContextCreateImage(context);
    UIImage*grayImage=[UIImage imageWithCGImage:grayImageRef];
    CGContextRelease(context);
    CGImageRelease(grayImageRef);
    return grayImage;
}

@end
