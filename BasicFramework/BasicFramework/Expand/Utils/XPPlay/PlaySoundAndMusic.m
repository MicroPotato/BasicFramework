//
//  PlaySoundAndMusic.m
//  BJL
//
//  Created by bob on 15/4/28.
//  Copyright (c) 2015年 JiuMu. All rights reserved.
//


#import "PlaySoundAndMusic.h"
#import <AVFoundation/AVFoundation.h>


static PlaySoundAndMusic *playSoundAndMusic = nil;

@interface PlaySoundAndMusic()<AVAudioPlayerDelegate>

///背景音乐
@property (nonatomic, strong) AVAudioPlayer *backgroundMusicAudioPlayer;//背景音乐播放器

///队列播放
@property (nonatomic, strong) AVAudioPlayer *soundAudioPlayer;//音效播放器
@property (nonatomic, strong) dispatch_queue_t playerQueue;
@property (nonatomic, strong) NSMutableArray *mDatas;//队列播放
@property (nonatomic, assign) BOOL isQueuePlaying;//队列正在播放中

/// 动画音效
@property (nonatomic, strong) AVAudioPlayer *animationAudioPlayer;//动画音效播放器

///common
@property (nonatomic, assign) CGFloat musicVolume;//音乐音效的音量





@end

@implementation PlaySoundAndMusic

#pragma - attribute
- (dispatch_queue_t)playerQueue
{
    if (_playerQueue == NULL) {
        // DISPATCH_QUEUE_SERIAL 串行队列 | DISPATCH_QUEUE_CONCURRENT 并行队列
        _playerQueue = dispatch_queue_create("playerQueue", DISPATCH_QUEUE_SERIAL);
    }
    return _playerQueue;
}


- (NSMutableArray *)mDatas
{
    if (_mDatas == nil) {
        _mDatas = [[NSMutableArray alloc] init];
    }
    return _mDatas;
}

#pragma mark - life
- (void)dealloc
{
    [self stopBackgroundMusic];
    [self clearSoundQueueType];
    [self stopPlaySound];
    
    self.playerQueue = NULL;
}

+ (PlaySoundAndMusic *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playSoundAndMusic = [[[self class] alloc] init];
    });
    return playSoundAndMusic;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self loadDefault];
    }
    return self;
}

- (void) loadDefault
{
    _isQueuePlaying = NO;
    _musicVolume = 1;
}

#pragma mark - function
//这种方式是强调的是队列播放
- (void) playSoundQueueTypeWithName:(NSString *) soundName
{
    if (self.isQueuePlaying) {
        //如果正在播放，就加入列表
        [self.mDatas addObject:[soundName mutableCopy]];
    } else {
        _isQueuePlaying = YES;
        [self playSoundWithName:[soundName mutableCopy] rate:1];
    }
}

- (void)playSoundWithName:(NSString *)soundName rate:(CGFloat) rate
{
    NSString *soundMusicPath = [[NSBundle mainBundle] pathForResource:soundName
                                                               ofType:@"mp3"];
    BOOL fileExit = [[NSFileManager defaultManager] fileExistsAtPath:soundMusicPath];
    if (fileExit == NO) {
        _isQueuePlaying = NO;
        return ;
    }
    
    dispatch_async(self.playerQueue, ^{
        NSData *data = [NSData dataWithContentsOfFile:soundMusicPath];
        NSError *error = nil;
        //防止多线程时候，前面的被释放了
        if (_soundAudioPlayer) {
            if (_soundAudioPlayer.isPlaying) {
                [_soundAudioPlayer stop];
            }
            _soundAudioPlayer = nil;
        }
        _soundAudioPlayer = [[AVAudioPlayer alloc] initWithData:data error:&error];
        _soundAudioPlayer.delegate = self;
        _soundAudioPlayer.enableRate = YES;
        _soundAudioPlayer.rate = rate;
        _soundAudioPlayer.volume = _musicVolume;
        
        if (_soundAudioPlayer != nil) {
            if ([_soundAudioPlayer prepareToPlay]) {
                if ([_soundAudioPlayer play]) {
                    _isQueuePlaying = YES;
                }
            }
        } else {
            _isQueuePlaying = NO;
        }
    });
    
}

//暂停，清空队列播放
- (void) clearSoundQueueType
{
    if (self.soundAudioPlayer.isPlaying) {
        [self.soundAudioPlayer stop];
        self.soundAudioPlayer = nil;
    }
    [self.mDatas removeAllObjects];
    self.mDatas = nil;
    _isQueuePlaying = NO;
}

///改变音效的大小
- (void)setMusicVolume:(CGFloat)musicVolume
{
    _musicVolume = musicVolume;
    if (_backgroundMusicAudioPlayer && _backgroundMusicAudioPlayer.isPlaying) {
        _backgroundMusicAudioPlayer.volume = musicVolume;
    }
    if (_soundAudioPlayer && _soundAudioPlayer.isPlaying) {
        _soundAudioPlayer.volume = musicVolume;
    }
    if (_animationAudioPlayer && _animationAudioPlayer.isPlaying) {
        _animationAudioPlayer.volume = musicVolume;
    }
}


///播放游戏音效
- (void) playSoundEffectWithName:(NSString *) soundName
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self stopPlaySound];
        NSString *path = [[NSBundle mainBundle] pathForResource:soundName ofType:@"mp3"];
        BOOL fileExit = [[NSFileManager defaultManager] fileExistsAtPath:path];
        if (fileExit == NO) {
            return ;
        }
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSError *error = nil;
        _animationAudioPlayer  = [[AVAudioPlayer alloc] initWithData:data error:&error];
        if (error) {
            return;
        }
        
        if (_animationAudioPlayer != nil) {
            _animationAudioPlayer.delegate = self;
            _animationAudioPlayer.enableRate = NO;
            _animationAudioPlayer.volume = _musicVolume;
            if ([_animationAudioPlayer prepareToPlay]) {
                if ([_animationAudioPlayer play]) {
                    
                }
            }
        }
    
    });
    
}

- (void) stopPlaySound
{
    if (self.animationAudioPlayer) {
        if (self.animationAudioPlayer.isPlaying) {
            [self.animationAudioPlayer stop];
        }
        self.animationAudioPlayer = nil;
    }
}

- (void)playBackgroundMusic
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *backgroundMusicPath = [[NSBundle mainBundle] pathForResource:@"background_music"
                                                                        ofType:@"mp3"];
        BOOL fileExit = [[NSFileManager defaultManager] fileExistsAtPath:backgroundMusicPath];
        if (fileExit == NO) {
            return ;
        }

        NSData *data = [NSData dataWithContentsOfFile:backgroundMusicPath];
        NSError *error = nil;
        if (_backgroundMusicAudioPlayer)
        {
            if ([_backgroundMusicAudioPlayer isPlaying])
            {
                [_backgroundMusicAudioPlayer stop];
            }
            _backgroundMusicAudioPlayer = nil;
        }
        
        _backgroundMusicAudioPlayer = [[AVAudioPlayer alloc] initWithData:data error:&error];
        if (error)
        {
            return;
        }
        
        //_backgroundMusicAudioPlayer = [[AVAudioPlayer alloc] initWithData:data error:&error];
        if (_backgroundMusicAudioPlayer != nil)
        {
            _backgroundMusicAudioPlayer.delegate = self;
            _backgroundMusicAudioPlayer.enableRate = NO;
            _backgroundMusicAudioPlayer.numberOfLoops = -1;
            _backgroundMusicAudioPlayer.volume = _musicVolume;
            if ([_backgroundMusicAudioPlayer prepareToPlay])
            {
                if ([_backgroundMusicAudioPlayer play])
                {
                    
                }
            }
        }
        
    });
}

- (void)stopBackgroundMusic
{
    if (_backgroundMusicAudioPlayer.isPlaying)
    {
        [_backgroundMusicAudioPlayer stop];
    }
    if (_backgroundMusicAudioPlayer) {
        _backgroundMusicAudioPlayer = nil;
    }
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
                       successfully:(BOOL)flag
{
    ///队列播放时
    if ([player isEqual:self.soundAudioPlayer]) {
        [self.soundAudioPlayer stop];
        self.soundAudioPlayer = nil;
        _isQueuePlaying = NO;
        if (self.mDatas && self.mDatas.count > 0) {
            _isQueuePlaying = YES;
            [self playSoundWithName:[self.mDatas firstObject] rate:1];
            [self.mDatas removeObjectAtIndex:0];
        }
    }
}

//当程序被应用外部打断之后，重新回到应用程序的时候触发。在这里当回到此应用程序的时候，继续播放音乐。
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player
                       withOptions:(NSUInteger)flags
{

}


@end
