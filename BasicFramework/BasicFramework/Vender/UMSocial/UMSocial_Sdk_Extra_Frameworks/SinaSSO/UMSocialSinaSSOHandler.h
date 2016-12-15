//
//  UMSocialSinaSSOHandler.h
//  SocialSDK
//
//  Created by Gavin Ye on 3/27/15.
//  Copyright (c) 2015 Umeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 使用最新版本的新浪微博官方SDK处理新浪微博SSO授权
 
 */
@interface UMSocialSinaSSOHandler : NSObject

/**
 设置使用最新新浪微博SDK来处理SSO授权
 
 @param redirectURL 回调URL

 */
+(void)openNewSinaSSOWithRedirectURL:(NSString *)redirectURL;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com