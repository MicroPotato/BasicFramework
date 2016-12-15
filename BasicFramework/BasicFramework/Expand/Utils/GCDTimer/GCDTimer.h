//
//  GCDTimer.h
//  GCDForTime
//
//  Created by txp on 15/6/3.
//  Copyright (c) 2015年 ___ChengPeng___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDTimer : NSObject

/**
 * timeout 时长
 * secondRate 变化比例 ，秒的比例
 * timeInnerBlock 定时内block
 * timeCompleteBlock 定时完成block
**/
+ (void)GCDTimerWithTimeout:(NSTimeInterval) timeout
                 secondRate:(CGFloat) secondRate
             timeInnerBlock:(void(^)(NSTimeInterval currentTime))timeInnerBlock
          timeCompleteBlock:(void(^)())timeCompleteBlock;

/**
 * 睡多少秒后倒计时
**/

+(void) GCDSleepWithTimeSEC:(NSTimeInterval) timeSEC
                actionBlock:(void(^)())actionBlock;

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
                      timeCompleteBlock:(void(^)())timeCompleteBlock;

@end
