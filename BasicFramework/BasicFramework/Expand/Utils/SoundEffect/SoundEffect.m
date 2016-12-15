//
//  SoundEffect.m
//  CommonMacro
//
//  Created by txp on 15/11/9.
//  Copyright (c) 2015年 JiuMu. All rights reserved.
//

#import "SoundEffect.h"

@implementation SoundEffect

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

/**
 * @brief 初始化
 * @prama filePath 路径
 */
+ (instancetype) soundEffectWithContentsOfFile:(NSString *) filePath
{
    if (filePath)
    {
        return [[SoundEffect alloc] initWithContentsOfFile:filePath];
    }
    return nil;
}

/**
 * @brief 初始化
 * @prama filePath 路径
 */
- (instancetype) initWithContentsOfFile:(NSString *) filePath
{
    self = [self init];
    if (self)
    {
        NSURL *fileURL = [NSURL fileURLWithPath:filePath isDirectory:NO];
        if (filePath)
        {
            SystemSoundID aSoundID;
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &aSoundID);
            if (error == kAudioServicesNoError)
            {
                _soundID = aSoundID;
            }
            else
            {
                self = nil;
            }
        }
        else
        {
            self = nil;
        }
    }
    return self;
}

/**
 * @brief 播放
 */
- (void) play
{
    AudioServicesPlaySystemSound(_soundID);
}

/**
 * @brief 振动
 */
- (void) shake
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}


@end
