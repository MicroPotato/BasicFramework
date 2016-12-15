//
//  AppDelegate+Config.m
//  BasicFramework
//
//  Created by wszhg on 16/9/9.
//  Copyright © 2016年 Peng. All rights reserved.
//

#import "AppDelegate+Config.h"
#import <JSPatch/JSPatch.h>

@implementation AppDelegate (Config)

#pragma mark - function
/**
 *  @brief 配置链接库
 */
- (void) configLib
{
    [self configJSPatch];
}


#pragma mark 配置键盘
/**
 *  @brief 配置键盘
 */
- (void) configKeyboard
{

}

#pragma mark 配置友盟
/**
 *  @brief 配置友盟
 */
- (void) configMobClick
{

}

#pragma mark 配置JSPatch
/**
 *  @brief 配置 JSPatch
 */
- (void) configJSPatch
{
    [JSPatch setupLogger:^(NSString * message) {
        DLog(@"%@",message);
    }];
    
    [JSPatch startWithAppKey:GSPatch_APPKEY];
    [JSPatch sync];
}



@end
