//
//  NSString+YT.m
//  新浪微博
//
//  Created by Whunf on 14-5-18.
//  Copyright (c) 2014年 TXP. All rights reserved.
//

#import "NSString+XP.h"

@implementation NSString (XP)
/**
 * @brief 修改文件名
 * @prama title 需要在原来的基础上拼接的部分
 */
- (NSString *) fileAppend:(NSString *)title
{
    //获取文件名扩展名
    NSString *ext = [self pathExtension];
    //删除扩展名
    NSString *string = [self stringByDeletingPathExtension];
    //拼接需要加入文件名的字符串
    string = [string stringByAppendingString:title];
    //拼接扩展名，返回
    return [string stringByAppendingPathExtension:ext];
}

/**
 * @brief 去掉字符串中的空格
 */
- (NSString *) trimSpace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/**
 *  @brief 判断是否有空格
 *
 *  @param string 串
 *
 *  @return YES = 是， NO = 没有
 */
+ (BOOL)isSpaceString:(NSString *)string
{
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

/**
 * @brief # 替换 @
 */
- (NSString *)replacingAtWithOctothorpe
{
    return [self stringByReplacingOccurrencesOfString:@"@" withString:@"#"];
}

/**
 * @brief @ 替换 #
 */
- (NSString *)replacingOctothorpeWithAt
{
    return [self stringByReplacingOccurrencesOfString:@"#" withString:@"@"];
}

/**
 * @brief 将回车(\n)替换为空格
 */
- (NSString *)replacingEnterWithNull
{
    return [self stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}

/**
 * @brief 生成 * 号串
 * @prama count 个数
 */
+ (NSString *) starStringWithCount:(NSInteger) count
{
    NSString *star = @"";
    for (NSInteger i = 0; i < count; i++)
    {
        [star stringByAppendingString:@"*"];
    }
    return star;
}

/**
 * @brief 是否包含汉字
 */
- (BOOL) isContainsChineseWord
{
    NSInteger count = self.length;
    for (NSInteger i = 0; count; i++)
    {
        unichar a = [self characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}

/**
 * @brief null 或者 @"" 返回 yes
 */
- (BOOL) isNull
{
    if (self == nil || [self isEqualToString:@""])
    {
        return YES;
    }
    return NO;
}

/**
 * @brief 判断是否纯数字
 */
- (BOOL) isPureInt
{
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

/**
 * @brief 判断是否为浮点型
 */
- (BOOL) isPureFloat
{
    NSScanner *scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

/**
 * @brief 截取制定小数位的值
 * @param doubleValue 值
 * @param position 有效小数位
 * @param rounding 是否四舍五入
 */
+ (NSString *) doubleValue:(double) doubleValue
                afterPoint:(NSInteger) position
                  rounding:(BOOL) rounding
{
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:rounding == YES ? NSRoundBankers : NSRoundDown
                                                                                                      scale:position
                                                                                           raiseOnExactness:NO
                                                                                            raiseOnOverflow:NO
                                                                                           raiseOnUnderflow:NO
                                                                                        raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    
    ouncesDecimal = [[NSDecimalNumber alloc] initWithDouble:doubleValue];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    return [NSString stringWithFormat:@"%@",roundedOunces];
}

/**
 * @brief 返回文本的大小
 * @prama font 字体
 * @prama maxSize 限制
 */
- (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    NSDictionary * attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end



@implementation NSString (FloatNumberFormat)

/**
 *  @brief 小数点样式，处理浮点型数据，小数部分为0，只显示整数部分；小数部分不为0，显示2位小数，非四舍五入的方法截取
 *
 *  @param doubleValue 值
 *
 *  @return 字符串
 */
- (NSString *) formatStringWithDouble:(double) doubleValue
{
    double i = roundl(doubleValue);
    return (i == doubleValue ?  [NSString stringWithFormat:@"%.0lf",doubleValue] : [NSString stringWithFormat:@"%.2lf",doubleValue]);
}

/**
 *  @brief 对数字千位分割,没有小数
 *
 *  @param aValue
 *
 *  @return
 */
- (NSString *) formatStringThousandNoDecimalsWithValue:(long long)aValue
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *numberString = [numberFormatter stringFromNumber:[NSNumber numberWithLongLong:aValue]];
    return numberString;
}

/**
 *  @brief 对数字千位分割,两位小数
 *
 *  @param aValue
 *
 *  @return
 */
- (NSString *) formatStringThousandTwoDecimalsWithValue:(long long)aValue
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    numberFormatter.positiveFormat = @"###,##0.00;";
    NSString *numberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:aValue]];
    return numberString;
}

@end


