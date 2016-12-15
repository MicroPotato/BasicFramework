//
//  UncaughtExceptionHandler.h
//  BJL
//
//  Created by txp on 15/11/26.
//  Copyright (c) 2015年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UncaughtExceptionHandler : NSObject
{
    BOOL dismissed;
}

@end

void HandleException(NSException *exception);
void SignalHandler(int signal);


void InstallUncaughtExceptionHandler(void);