//
//  Common_view.h
//  BasicFramework
//
//  Created by wszhg on 16/9/22.
//  Copyright © 2016年 Peng. All rights reserved.
//

#ifndef Common_view_h
#define Common_view_h

/**
 *  @brief 设置view的圆角和边框
 *
 *  @param View   view
 *  @param Radius 角度
 *  @param Width  线宽度
 *  @param Color  颜色
 *
 *  @return
 */
#define kBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


#endif /* Common_view_h */
