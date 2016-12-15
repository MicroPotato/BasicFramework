//
//  Common_date.h
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

/**
 *  @brief 时间
 */

#ifndef Common_date_h
#define Common_date_h

/** 快速查询一段代码的执行时间 */
/** 用法
 TICK
 do your work here
 TOCK
 */
#define TICK NSDate *startTime = [NSDate date];
#define TOCK NSLog(@"Time:%f", -[startTime timeIntervalSinceNow]);


#endif /* Common_date_h */
