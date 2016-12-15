//
//  NSString+YT.h
//  新浪微博
//
//  Created by Whunf on 14-5-18.
//  Copyright (c) 2014年 TXP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (XP)

/**
 * @brief 修改文件名
 * @prama title 需要在原来的基础上拼接的部分
 */
- (NSString *) fileAppend:(NSString *)title;

/**
 * @brief 去掉字符串中的空格
 */
- (NSString *) trimSpace;

/**
 *  @brief 判断是否有空格
 *
 *  @param string 串
 *
 *  @return YES = 是， NO = 没有
 */
+ (BOOL)isSpaceString:(NSString *)string;

/**
 * @brief # 替换 @
 */
- (NSString *)replacingAtWithOctothorpe;

/**
 * @brief @ 替换 #
 */
- (NSString *)replacingOctothorpeWithAt;

/**
 * @brief 将回车(\n)替换为空格
 */
- (NSString *)replacingEnterWithNull;

/**
 * @brief 生成 * 号串
 * @prama count 个数
 */
+ (NSString *) starStringWithCount:(NSInteger) count;

/**
 * @brief 是否包含汉字
 */
- (BOOL) isContainsChineseWord;

/**
 * @brief null 或者 @"" 返回 yes
 */
- (BOOL) isNull;

/**
 * @brief 判断是否纯整数
 */
- (BOOL) isPureInt;

/**
 * @brief 判断是否为浮点型
 */
- (BOOL) isPureFloat;

/**
 * @brief 截取制定小数位的值
 * @param doubleValue 值
 * @param position 有效小数位
 * @param rounding 是否四舍五入
 */
+ (NSString *) doubleValue:(double) doubleValue
                afterPoint:(NSInteger) position
                  rounding:(BOOL) rounding;

/**
 * @brief 返回文本的大小
 * @prama font 字体
 * @prama maxSize 限制
 */
- (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize;




@end


/**
 *  @brief 浮点数格式
 */
@interface NSString (FloatNumberFormat)

/**
 *  @brief 小数点样式，处理浮点型数据，小数部分为0，只显示整数部分；小数部分不为0，显示2位小数，非四舍五入的方法截取
 *
 *  @param doubleValue 值
 *
 *  @return 字符串
 */
- (NSString *) formatStringWithDouble:(double) doubleValue;

/**
 *  @brief 对数字千位分割,没有小数
 *
 *  @param aValue
 *
 *  @return
 */
- (NSString *) formatStringThousandNoDecimalsWithValue:(long long)aValue;

/**
 *  @brief 对数字千位分割,两位小数
 *
 *  @param aValue
 *
 *  @return
 */
- (NSString *) formatStringThousandTwoDecimalsWithValue:(long long)aValue;



@end

