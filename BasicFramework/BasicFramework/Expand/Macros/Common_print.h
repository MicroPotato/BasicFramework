//
//  Common_print.h
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

/**
 *  @brief 打印相关
 */

#ifndef Common_print_h
#define Common_print_h

/**
 * @brief 定义打印
 */
#define DEBUG_MODE 1
#if DEBUG_MODE

#define XPLOG NSLog
#define ELog(err) {if(err) DLog(@"%@", err)}
#define DLog(fmt, ...) {NSLog((@" file = %s, function = %s, line = %d " fmt),[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}

#else

#define XPLOG(...)
#define ELog(err)
#define DLog(...)

#endif


#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif

/**
 *print 打印rect,size,point
 */
#ifdef DEBUG
#define kLogPoint(point)    NSLog(@"%s = { x:%.4f, y:%.4f }", #point, point.x, point.y)
#define kLogSize(size)      NSLog(@"%s = { w:%.4f, h:%.4f }", #size, size.width, size.height)
#define kLogRect(rect)      NSLog(@"%s = { x:%.4f, y:%.4f, w:%.4f, h:%.4f }", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#endif


/**
 * @brief 打印当前函数
 */
#define XP_LOG_CURRENT_FUNCTION XPLOG(@"%s",__FUNCTION__)


#endif /* Common_print_h */
