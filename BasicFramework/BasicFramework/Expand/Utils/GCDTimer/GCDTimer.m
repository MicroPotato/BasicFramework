//
//  GCDTimer.m
//  GCDForTime
//
//  Created by txp on 15/6/3.
//  Copyright (c) 2015年 ___ChengPeng___. All rights reserved.
//

#import "GCDTimer.h"
#import <Foundation/Foundation.h>

@implementation GCDTimer


/**
 * timeout 时长
 * secondRate 变化比例 ，秒的比例
 * timeInnerBlock 定时内block
 * timeCompleteBlock 定时完成block
 **/
+ (void)GCDTimerWithTimeout:(NSTimeInterval) timeout
                 secondRate:(CGFloat) secondRate
             timeInnerBlock:(void(^)(NSTimeInterval currentTime))timeInnerBlock
          timeCompleteBlock:(void(^)())timeCompleteBlock
{
    __block int timeout_t = timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),secondRate * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout_t<=0)
        { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                timeCompleteBlock();
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                timeInnerBlock(timeout_t);
            });
            timeout_t -= secondRate;
        }
    });
    dispatch_resume(_timer);
}


/**
 *  @brief GCD定时器
 *
 *  @param timeout           时长
 *  @param secondRate        变化比例 ，秒的比例
 *  @param timeInnerBlock    定时内block continueTimer 可提前结束定时
 *  @param timeCompleteBlock 定时完成block
 */
+ (void)GCDTimerHandleCancelWithTimeout:(NSTimeInterval) timeout
                             secondRate:(CGFloat) secondRate
                         timeInnerBlock:(void(^)(NSTimeInterval currentTime,BOOL *continueTimer))timeInnerBlock
                      timeCompleteBlock:(void(^)())timeCompleteBlock
{
    __block int timeout_t = timeout; //倒计时时间
    __block BOOL *continue_timer;
    BOOL yesBool = YES;
    continue_timer = &yesBool;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),secondRate * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout_t<=0)
        { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                timeCompleteBlock();
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                timeInnerBlock(timeout_t,continue_timer);
            });
            if (continue_timer == NO) {
                dispatch_source_cancel(_timer);
            } else {
                timeout_t -= secondRate;
            }
            
        }
    });
    dispatch_resume(_timer);
}

/**
 * 睡多少秒后倒计时
 **/

+(void) GCDSleepWithTimeSEC:(NSTimeInterval) timeSEC
                actionBlock:(void(^)())actionBlock
{
    dispatch_time_t tQueue = dispatch_time(DISPATCH_TIME_NOW, timeSEC *NSEC_PER_SEC);
    dispatch_after(tQueue, dispatch_get_main_queue(), ^{
        actionBlock();
    });
}

@end
