//
//  ListenToCall.m
//  CommonMacro
//
//  Created by txp on 16/7/27.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import "ListenToCall.h"


@implementation ListenToCall


/**
 *  @brief 开始监听
 */
- (void) detectCall
{
    CTCallCenter *callCenter = [[CTCallCenter alloc] init];
    callCenter.callEventHandler = ^(CTCall * call) {
        if ([call.callState isEqualToString:CTCallStateConnected]) {
            
        } else if ([call.callState isEqualToString:CTCallStateDialing]) {
        
        } else if ([call.callState isEqualToString:CTCallStateDisconnected]) {
            
        } else if ([call.callState isEqualToString:CTCallStateIncoming]) {
            
        } else {
        
        }
    };
}

@end
