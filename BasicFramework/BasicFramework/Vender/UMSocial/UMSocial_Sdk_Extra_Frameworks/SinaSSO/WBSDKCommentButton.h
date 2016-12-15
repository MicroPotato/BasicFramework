//
//  WBSDKCommentButton.h
//  WeiboSDK
//
//  Created by DannionQiu on 14/10/26.
//  Copyright (c) 2014年 SINA iOS Team. All rights reserved.
//

#import "WBSDKBasicButton.h"

@interface WBSDKCommentButton : WBSDKBasicButton

/**
 初始化一个社会化评论按钮
 @param frame 按钮的frame值
 @param accessToken 用户授权后获取的Token
 @param keyWord 社会化评论的热点词
 @param urlString 社会化评论链接，可传空
 @param category  领域ID, 此参数为必选参数。
 @param handler   回调函数，当用户点击按钮，进行完与社会化评论组件相关的交互之后，回调的函数。
 */
- (id)initWithFrame:(CGRect)frame
        accessToken:(NSString*)accessToken
            keyword:(NSString*)keyWord
          urlString:(NSString*)urlString
           category:(NSString*)category
  completionHandler:(WBSDKButtonHandler)handler;

@property (nonatomic, retain)NSString* keyWord;
@property (nonatomic, retain)NSString* accessToken;
@property (nonatomic, retain)NSString* urlString;
@property (nonatomic, retain)NSString* category;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com