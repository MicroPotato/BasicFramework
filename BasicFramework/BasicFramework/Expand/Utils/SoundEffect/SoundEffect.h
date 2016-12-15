//
//  SoundEffect.h
//  CommonMacro
//
//  Created by txp on 15/11/9.
//  Copyright (c) 2015年 JiuMu. All rights reserved.
//
// 这个类是重新整理之前的第三方用的,主要用来播放系统支持的音频文件tff,和振动


#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SoundEffect : NSObject
{
    SystemSoundID _soundID;
}

/**
 * @brief 初始化
 * @prama filePath 路径
 */
+ (instancetype) soundEffectWithContentsOfFile:(NSString *) filePath;

/**
 * @brief 初始化
 * @prama filePath 路径
 */
- (instancetype) initWithContentsOfFile:(NSString *) filePath;

/**
 * @brief 播放
 */
- (void) play;

/**
 * @brief 振动
 */
- (void) shake;


@end
