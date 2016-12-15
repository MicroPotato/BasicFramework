//
//  Common_function.h
//  BasicFramework
//
//  Created by wszhg on 16/9/23.
//  Copyright © 2016年 Peng. All rights reserved.
//


/**
 *  @brief 常用的函数 
 */
#ifndef Common_function_h
#define Common_function_h

/**
 *  @brief 两个数之间求最小
 */
#define MIN(A,B) ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a < __b ? __a : __b; })



/**
 *  @brief 两个数之间求最大
 */
#define MAX(A,B) ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a > __b ? __a : __b; })



/**
 *  @brief 两个数的和
 */
#define SUM(A,B) ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a + __b; })


/**
 *  @brief 两个数之差
 *
 *  @param A 被减数
 *  @param B 减数
 *
 *  @return 差
 */
#define MINUS(A,B) ({ __typeof__(A) __a = (A); __typeof__(B) __b = (B); __a - __b; })





#endif /* Common_function_h */
