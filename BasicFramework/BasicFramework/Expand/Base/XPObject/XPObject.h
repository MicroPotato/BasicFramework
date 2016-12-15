//
//  XPObject.h
//  BasicFramework
//
//  Created by wszhg on 16/9/19.
//  Copyright © 2016年 Peng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+CustomDealloc.h"
#import "NSObject+LoadDefault.h"
#import "Common_endian.h"

/**
 *  @brief XP对象
 */
@interface XPObject : NSObject
@property (nonatomic, assign) BOOL isBigEndian_goal;//<！大端格式还是小端格式,针对的是目标，是要转出去的
@property (nonatomic, assign, readonly) BOOL isBigEndian_self;//<！大端格式还是小端格式,针对的是自己

/**
 *  @brief 是否是大端格式
 *
 *  @return YES = 大端， NO = 小端
 */
+ (BOOL) isBigEndian;

#pragma mark - swap
/**
 *  @brief bool 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) boolToDataWithValue:(BOOL) value;

/**
 *  @brief Boolean 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) booleanToDataWithValue:(Boolean) value;

/**
 *  @brief char 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) charToDataWithValue:(char) value;

/**
 *  @brief byte 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) byteToDataWithValue:(Byte) value;

/**
 *  @brief short 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) shortToDataWithValue:(short) value;

/**
 *  @brief int 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) intToDataWithValue:(int) value;

/**
 *  @brief  long int 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) longintToDataWithValue:(long int) value;


/**
 *  @brief  long long int 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) longlongintToDataWithValue:(long long int) value;

/**
 *  @brief float 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) floatToDataWithValue:(float) value;


/**
 *  @brief double 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) doubleToDataWithValue:(double) value;

/**
 *  @brief NSString 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) stringToDataWithValue:(NSString *) value;



/**
 *  @brief data 转 NSString
 *
 *  @param data 二进制数据流
 *
 *  @return NSString
 */
- (NSString *) readStringWithData:(NSData *) data;


/**
 *  @brief data 转 double
 *
 *  @param data 二进制数据流
 *
 *  @return double
 */
- (double) readDoubleWithData:(NSData *) data;


/**
 *  @brief data 转 float
 *
 *  @param data 二进制数据流
 *
 *  @return float
 */
- (float) readFloatWithData:(NSData *) data;

/**
 *  @brief data 转 long long int
 *
 *  @param data 二进制数据流
 *
 *  @return long long int
 */
- (long long int) readLonglongintWithData:(NSData *) data;

/**
 *  @brief data 转 long int
 *
 *  @param data 二进制数据流
 *
 *  @return long int
 */
- (long int) readLongintWithData:(NSData *) data;

/**
 *  @brief data 转 int
 *
 *  @param data 二进制数据流
 *
 *  @return  int
 */
- (int) readIntWithData:(NSData *) data;


/**
 *  @brief data 转 short
 *
 *  @param data 二进制数据流
 *
 *  @return  short
 */
- (short) readShortWithData:(NSData *) data;

/**
 *  @brief data 转 char
 *
 *  @param data 二进制数据流
 *
 *  @return  char
 */
- (char) readCharWithData:(NSData *) data;

/**
 *  @brief data 转 Byte
 *
 *  @param data 二进制数据流
 *
 *  @return  Byte
 */
- (Byte) readByteWithData:(NSData *) data;

/**
 *  @brief data 转 Boolean
 *
 *  @param data 二进制数据流
 *
 *  @return  Boolean
 */
- (Boolean) readBooleanWithData:(NSData *) data;

/**
 *  @brief data 转 BOOL
 *
 *  @param data 二进制数据流
 *
 *  @return  BOOL
 */
- (BOOL) readBOOLWithData:(NSData *) data;


@end
