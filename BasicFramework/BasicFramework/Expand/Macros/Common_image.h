//
//  Common_image.h
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

/**
 *  @brief 图片相关
 */

#ifndef Common_image_h
#define Common_image_h


/**
 * @brief 拉伸图片
 */
#define kImageWithUIEdge(imageName) [[UIImage imageNamed:(imageName)] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeStretch]


/**
 * @brief 加载图片，没有缓存
 */
#define kLoadImage(fileName,type) ([UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:(fileName) ofType:(type)]])


/**
 * @brief 获取图片,有缓存，但这个常用，assets.xcassets里的用这个吧
 */
#define kImageName(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]



#endif /* Common_image_h */
