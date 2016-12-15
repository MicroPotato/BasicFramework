//
//  Common_memory.h
//  BasicFramework
//
//  Created by wszhg on 16/9/23.
//  Copyright © 2016年 Peng. All rights reserved.
//


/**
 *  @brief 内存相关
 */

#ifndef Common_memory_h
#define Common_memory_h

/**
 *  @brief 使用ARC和不使用ARC
 */
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

/**
 *  @brief 释放一个对象
 */
#define SAFE_DELETE(P) if(P) { [P release], P = nil; }
#define SAFE_RELEASE(x) {[x release];x = nil;}



#endif /* Common_memory_h */
