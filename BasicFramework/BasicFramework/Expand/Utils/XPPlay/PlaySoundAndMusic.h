//
//  PlaySoundAndMusic.h
//  BJL
//
//  Created by bob on 15/4/28.
//  Copyright (c) 2015年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlaySoundAndMusic : NSObject

+ (PlaySoundAndMusic *)shareInstance;

///背景音乐
- (void)playBackgroundMusic;//播放背景音乐
- (void)stopBackgroundMusic;//停止播放背景音乐

///设置音量大小
- (void)setMusicVolume:(CGFloat)musicVolume;//设置音量大小

///播放音效
//是强调的是队列播放
- (void) playSoundQueueTypeWithName:(NSString *) soundName;
//暂停，清空队列播放
- (void) clearSoundQueueType;

///播放游戏音效
- (void) playSoundEffectWithName:(NSString *) soundName;
- (void) stopPlaySound;



@end
