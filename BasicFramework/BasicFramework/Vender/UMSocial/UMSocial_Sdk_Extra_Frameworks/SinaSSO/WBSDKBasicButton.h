//
//  WBSDKBasicButton.h
//  WeiboSDK
//
//  Created by DannionQiu on 14/10/24.
//  Copyright (c) 2014年 SINA iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBSDKBasicButton;
typedef void (^WBSDKButtonHandler)(WBSDKBasicButton *button,
                                BOOL isSuccess,
                                NSDictionary *resultDict);

@interface WBSDKBasicButton : UIButton

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com