//
//  NSArray+XP.h
//  CommonMacro
//
//  Created by wszhg on 16/3/22.
//  Copyright (c) 2016年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (XP)

@end


//----------------- NSArray 数据的安全访问----------------------
@interface NSArray (SafeAccess)

/**
 * id 类型
 **/
- (id) idSafeWithIndex:(NSUInteger) index;

/**
 * NSString 类型
 **/
- (NSString *) stringSafeWithIndex:(NSUInteger) index;

/**
 * NSNumber 类型
 **/
- (NSNumber *) numberSafeWithIndex:(NSUInteger) index;

/**
 * NSArray 类型
 **/
- (NSArray *) arraySafeWithIndex:(NSUInteger) index;

/**
 * NSDictionary 类型
 **/
- (NSDictionary *) dictionarySafeWithIndex:(NSUInteger) index;

/**
 * NSInteger 类型
 **/
- (NSInteger ) integerSafeWithIndex:(NSUInteger) index;

/**
 * NSUInteger 类型
 **/
- (NSUInteger) uintegerSafeWithIndex:(NSUInteger) index;

/**
 * BOOL 类型
 **/
- (BOOL) boolSafeWithIndex:(NSUInteger) index;

/**
 * int16_t 类型
 **/
- (int16_t) int16SafeWithIndex:(NSUInteger) index;

/**
 * int32_t 类型
 **/
- (int32_t) int32SafeWithIndex:(NSUInteger) index;

/**
 * int64_t 类型
 **/
- (int64_t ) int64SafeWithIndex:(NSUInteger) index;

/**
 * char 类型
 **/
- (char) charSafeWithIndex:(NSUInteger) index;

/**
 * short 类型
 **/
- (short) shortSafeWithIndex:(NSUInteger) index;

/**
 * float 类型
 **/
- (float) floatSafeWithIndex:(NSUInteger) index;

/**
 * double 类型
 **/
- (double) doubleSafeWithIndex:(NSUInteger) index;

/**
 * CGFloat 类型
 **/
- (CGFloat) CGFloatSafeWithIndex:(NSUInteger) index;

/**
 * CGPoint 类型
 **/
- (CGPoint) CGPointSafeWithIndex:(NSUInteger) index;

/**
 * CGSize 类型
 **/
- (CGSize) CGSizeSafeWithIndex:(NSUInteger) index;

/**
 * CGRect 类型
 **/
- (CGRect) CGRectSafeWithIndex:(NSUInteger) index;

@end


//----------------- NSMutableArray 数据的安全访问----------------------
@interface NSMutableArray (SafeAccess)

/**
 * id 类型
 **/
- (void) addWaySafeObject:(id) object;

/**
 * NSString 类型
 **/
- (void) addWaySafeString:(NSString *) string;

/**
 * NSNumber 类型
 **/
- (void) addWaySafeNumber:(NSNumber *) number;

/**
 * NSArray 类型
 **/
- (void) addWaySafeArray:(NSArray *) array;

/**
 * NSDictionary 类型
 **/
- (void) addWaySafeDictionary:(NSDictionary *) dict;

/**
 * NSInteger 类型
 **/
- (void) addWaySafeInteger:(NSInteger) integer;

/**
 * NSUInteger 类型
 **/
- (void) addWaySafeUInteger:(NSUInteger) uInteger;

/**
 * BOOL 类型
 **/
- (void) addWaySafeBOOL:(BOOL) boolValue;

/**
 * int16_t 类型
 **/
- (void) addWaySafeInt16:(int16_t) int16;

/**
 * int32_t 类型
 **/
- (void) addWaySafeInt32:(int32_t) int32;

/**
 * int64_t 类型
 **/
- (void) addWaySafeInt64:(int64_t) int64;

/**
 * char 类型
 **/
- (void) addWaySafeChar:(char) charValue;

/**
 * short 类型
 **/
- (void) addWaySafeShort:(short) shortValue;

/**
 * float 类型
 **/
- (void) addWaySafeFloat:(float) floatValue;

/**
 * double 类型
 **/
- (void) addWaySafeDouble:(double) doubleValue;

/**
 * CGFloat 类型
 **/
- (void) addWaySafeCGFloat:(CGFloat) CGFloatValue;

/**
 * CGPoint 类型
 **/
- (void) addWaySafeCGPoint:(CGPoint) CGPointValue;

/**
 * CGSize 类型
 **/
- (void) addWaySafeCGSize:(CGSize) CGSizeValue;

/**
 * CGRect 类型
 **/
- (void) addWaySafeCGRect:(CGRect) CGRectValue ;


@end



