//
//  Common_endian.h
//  BasicFramework
//
//  Created by wszhg on 16/9/19.
//  Copyright © 2016年 Peng. All rights reserved.
//


/**
 *  @brief 大端还是小段格式的转化,高位和低位交换
 */

#ifndef Common_endian_h
#define Common_endian_h


/**
 *  @brief 64位数据高度和低地址的交换
 *
 *  @param A 值
 *
 *  @return 返回结果
 */
#define BigSwapLittle64(A)      ((((uint64)(A) & 0xff00000000000000) >> 56) | \
(((uint64)(A) & 0x00ff000000000000) >> 40) | \
(((uint64)(A) & 0x0000ff0000000000) >> 24) | \
(((uint64)(A) & 0x000000ff00000000) >> 8) | \
(((uint64)(A) & 0x00000000ff000000) << 8) | \
(((uint64)(A) & 0x0000000000ff0000) << 24) | \
(((uint64)(A) & 0x000000000000ff00) << 40) | \
(((uint64)(A) & 0x00000000000000ff) << 56))


/**
 *  @brief 32位数据高度和低地址的交换
 *
 *  @param A 值
 *
 *  @return 返回结果
 */
#define BigSwapLittle32(A)      ((((uint32)(A) & 0xff000000) >> 24) | \
(((uint32)(A) & 0x00ff0000) >> 8) | \
(((uint32)(A) & 0x0000ff00) << 8) | \
(((uint32)(A) & 0x000000ff) << 24))



/**
 *  @brief 16位数据高度和低地址的交换
 *
 *  @param A 值
 *
 *  @return  返回结果
 */
#define BigSwapLittle16(A)      ((((uint16)(A) & 0xff00) >> 8) | \
(((uint16)(A) & 0x00ff) << 8))






#endif /* Common_endian_h */
