//
//  NSArray+XP.m
//  CommonMacro
//
//  Created by wszhg on 16/3/22.
//  Copyright (c) 2016年 JiuMu. All rights reserved.
//

#import "NSArray+XP.h"

@implementation NSArray (XP)

@end

//----------------- NSArray 数据的安全访问----------------------
@implementation  NSArray (SafeAccess)

/**
 * id 类型
 **/
- (id) idSafeWithIndex:(NSUInteger) index
{
    if (index < self.count)
    {
        return [self objectAtIndex:index];
    }
    else
    {
        return nil;
    }
}

/**
 * NSString 类型
 **/
- (NSString *) stringSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return @"";
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value stringValue];
    }
    return nil;
}

/**
 * NSNumber 类型
 **/
- (NSNumber *) numberSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]])
    {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]])
    {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

/**
 * NSArray 类型
 **/
- (NSArray *) arraySafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}

/**
 * NSDictionary 类型
 **/
- (NSDictionary *) dictionarySafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

/**
 * NSInteger 类型
 **/
- (NSInteger ) integerSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] ||
        [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}

/**
 * NSUInteger 类型
 **/
- (NSUInteger) uintegerSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] ||
        [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}

/**
 * BOOL 类型
 **/
- (BOOL) boolSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSString class]] ||
        [value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    return NO;
}

/**
 * int16_t 类型
 **/
- (int16_t) int16SafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] ||
        [value isKindOfClass:[NSString class]])
    {
        return [value shortValue];
    }
    return 0;
}

/**
 * int32_t 类型
 **/
- (int32_t) int32SafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] ||
        [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

/**
 * int64_t 类型
 **/
- (int64_t ) int64SafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] ||
        [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}

/**
 * char 类型
 **/
- (char) charSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] ||
        [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

/**
 * short 类型
 **/
- (short) shortSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] ||
        [value isKindOfClass:[NSString class]])
    {
        return [value shortValue];
    }
    return 0;
}

/**
 * float 类型
 **/
- (float) floatSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] ||
        [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}

/**
 * double 类型
 **/
- (double) doubleSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] ||
        [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}

/**
 * CGFloat 类型
 **/
- (CGFloat) CGFloatSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] ||
        [value isKindOfClass:[NSString class]])
    {
        return (CGFloat)[value doubleValue];
    }
    return 0;
}

/**
 * CGPoint 类型
 **/
- (CGPoint) CGPointSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return CGPointZero;
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return CGPointFromString(value);
    }
    return CGPointZero;
}

/**
 * CGSize 类型
 **/
- (CGSize) CGSizeSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return CGSizeZero;
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return CGSizeFromString(value);
    }
    return CGSizeZero;
}

/**
 * CGRect 类型
 **/
- (CGRect) CGRectSafeWithIndex:(NSUInteger) index
{
    id value = [self idSafeWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return CGRectZero;
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return CGRectFromString(value);
    }
    return CGRectZero;
}

@end


//----------------- NSArray 数据的安全访问----------------------
@implementation NSMutableArray (SafeAccess)

/**
 * id 类型
 **/
- (void) addWaySafeObject:(id) object
{
    if (object != nil)
    {
        [self addObject:object];
    }
}

/**
 * NSString 类型
 **/
- (void) addWaySafeString:(NSString *) string
{
    if (string != nil)
    {
        [self addObject:string];
    }
}

/**
 * NSNumber 类型
 **/
- (void) addWaySafeNumber:(NSNumber *) number
{
    if (number != nil)
    {
        [self addObject:number];
    }
}

/**
 * NSArray 类型
 **/
- (void) addWaySafeArray:(NSArray *) array
{
    if (array != nil)
    {
        [self addObjectsFromArray:array];
    }
}

/**
 * NSDictionary 类型
 **/
- (void) addWaySafeDictionary:(NSDictionary *) dict
{
    if (dict != nil)
    {
        [self addObject:dict];
    }
}

/**
 * NSInteger 类型
 **/
- (void) addWaySafeInteger:(NSInteger) integer
{
    [self addObject:[NSNumber numberWithInteger:integer]];
}

/**
 * NSUInteger 类型
 **/
- (void) addWaySafeUInteger:(NSUInteger) uInteger
{
    [self addObject:[NSNumber numberWithUnsignedInteger:uInteger]];
}

/**
 * BOOL 类型
 **/
- (void) addWaySafeBOOL:(BOOL) boolValue
{
    [self addObject:[NSNumber numberWithBool:boolValue]];
}

/**
 * int16_t 类型
 **/
- (void) addWaySafeInt16:(int16_t) int16
{
    [self addObject:[NSNumber numberWithShort:int16]];
}

/**
 * int32_t 类型
 **/
- (void) addWaySafeInt32:(int32_t) int32
{
    [self addObject:[NSNumber numberWithInt:int32]];
}

/**
 * int64_t 类型
 **/
- (void) addWaySafeInt64:(int64_t) int64
{
    [self addObject:[NSNumber numberWithLongLong:int64]];
}

/**
 * char 类型
 **/
- (void) addWaySafeChar:(char) charValue
{
    [self addObject:[NSNumber numberWithChar:charValue]];
}

/**
 * short 类型
 **/
- (void) addWaySafeShort:(short) shortValue
{
    [self addObject:[NSNumber numberWithShort:shortValue]];
}

/**
 * float 类型
 **/
- (void) addWaySafeFloat:(float) floatValue
{
    [self addObject:[NSNumber numberWithFloat:floatValue]];
}

/**
 * double 类型
 **/
- (void) addWaySafeDouble:(double) doubleValue
{
    [self addObject:[NSNumber numberWithDouble:doubleValue]];
}

/**
 * CGFloat 类型
 **/
- (void) addWaySafeCGFloat:(CGFloat) CGFloatValue
{
    [self addObject:[NSNumber numberWithDouble:CGFloatValue]];
}

/**
 * CGPoint 类型
 **/
- (void) addWaySafeCGPoint:(CGPoint) CGPointValue
{
    [self addObject:NSStringFromCGPoint(CGPointValue)];
}

/**
 * CGSize 类型
 **/
- (void) addWaySafeCGSize:(CGSize) CGSizeValue
{
    [self addObject:NSStringFromCGSize(CGSizeValue)];
}

/**
 * CGRect 类型
 **/
- (void) addWaySafeCGRect:(CGRect) CGRectValue
{
    [self addObject:NSStringFromCGRect(CGRectValue)];
}

@end


