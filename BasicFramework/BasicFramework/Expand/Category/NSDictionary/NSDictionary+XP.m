//
//  NSDictionary+XP.m
//  CommonMacro
//
//  Created by wszhg on 16/3/22.
//  Copyright (c) 2016年 JiuMu. All rights reserved.
//

#import "NSDictionary+XP.h"

@implementation NSDictionary (XP)

@end

//-------------------  convent jsongstring -------------------
@implementation NSDictionary (JsonString)
/**
 * 字典转json
 **/
-(NSString *)jsonString
{
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    return data == nil ? nil : [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end


//-------------------  dictionary merge -------------------
@implementation NSDictionary (Merge)
/**
 * 求字典的并集
 */
+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1
                                 with:(NSDictionary *)dict2
{
    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:dict1];
    [dict2 enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop)
     {
         if (![dict1 objectForKey:key])
         {
             if ([obj isKindOfClass:[NSDictionary class]])
             {
                 NSDictionary * newVal = [[dict1 objectForKey: key] dictionaryByMergingWith: (NSDictionary *) obj];
                 [result setObject: newVal forKey: key];
             }
             else
             {
                 [result setObject: obj forKey: key];
             }
         }
     }];
    return (NSDictionary *) [result mutableCopy];
}

/**
 * 求字典的并集
 */
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict
{
    return [[self class] dictionaryByMerging:self with: dict];
}

@end


//-------------------- NSDictionary safe access -------------------------
@implementation NSDictionary (SafeAccess)
/**
 * NSString 类型
 **/
- (NSString *) stringSafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
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
- (NSNumber *) numberSafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
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
- (NSArray *) arraySafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
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
- (NSDictionary *) dictionarySafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
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
- (NSInteger ) integerSafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
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
- (NSUInteger) uintegerSafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
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
- (BOOL) boolSafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
    
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}

/**
 * int16_t 类型
 **/
- (int16_t) int16SafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

/**
 * int32_t 类型
 **/
- (int32_t) int32SafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
    
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
- (int64_t ) int64SafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
    
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
- (char) charSafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
    
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
- (short) shortSafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

/**
 * float 类型
 **/
- (float) floatSafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
    
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
- (double) doubleSafeForKey:(id) aKey
{
    id value = [self objectForKey:aKey];
    
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
- (CGFloat) CGFloatSafeForKey:(id) aKey
{
    CGFloat f = [self floatSafeForKey:aKey];
    return f;
}

/**
 * CGPoint 类型
 **/
- (CGPoint) CGPointSafeForKey:(id) aKey
{
    return CGPointFromString(self[aKey]);
}

/**
 * CGSize 类型
 **/
- (CGSize) CGSizeSafeForKey:(id) aKey
{
    return CGSizeFromString(self[aKey]);
}

/**
 * CGRect 类型
 **/
- (CGRect) CGRectSafeForKey:(id) aKey
{
    return CGRectFromString(self[aKey]);
}

@end


//------------------------NSMutableDictionary safe access ---------------------
@implementation NSMutableDictionary (SafeAccess)
/**
 * id 类型
 **/
- (void) setWaySafeObject:(id) value forKey:(NSString *) akey
{
    if (value != nil) [self setObject:value forKey:akey];
}

/**
 * NSString 类型
 **/
- (void) setWaySafeString:(NSString *) value forKey:(NSString *) akey
{
    if (value != nil) [self setObject:value forKey:akey];
}

/**
 * NSNumber 类型
 **/
- (void) setWaySafeNumber:(NSNumber *) value forKey:(NSString *) akey
{
    if (value != nil) [self setObject:value forKey:akey];
}

/**
 * NSArray 类型
 **/
- (void) setWaySafeArray:(NSArray *) value forKey:(NSString *) akey
{
    if (value != nil) [self setObject:value forKey:akey];
}

/**
 * NSDictionary 类型
 **/
- (void) setWaySafeDictionary:(NSDictionary *) value forKey:(NSString *) akey
{
    if (value != nil) [self setObject:value forKey:akey];
}

/**
 * NSInteger 类型
 **/
- (void) setWaySafeInteget:(NSInteger) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithInteger:value] forKey:akey];
}

/**
 * NSUInteger 类型
 **/
- (void) setWaySafeUInteger:(NSUInteger) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithUnsignedInteger:value] forKey:akey];
}

/**
 * BOOL 类型
 **/
- (void) setWaySafeBOOL:(BOOL) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithBool:value] forKey:akey];
}

/**
 * int16_t 类型
 **/
- (void) setWaySafeInt16:(int16_t) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithInt:value] forKey:akey];
}

/**
 * int32_t 类型
 **/
- (void) setWaySafeInt32:(int32_t) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithInt:value] forKey:akey];
}

/**
 * int64_t 类型
 **/
- (void) setWaySafeInt64:(int64_t) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithLongLong:value] forKey:akey];
}

/**
 * char 类型
 **/
- (void) setWaySafeChar:(char) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithChar:value] forKey:akey];
}

/**
 * short 类型
 **/
- (void) setWaySafeShort:(short) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithShort:value] forKey:akey];
}

/**
 * float 类型
 **/
- (void) setWaySafeFloat:(float) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithFloat:value] forKey:akey];
}

/**
 * double 类型
 **/
- (void) setWaySafeDouble:(double) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithDouble:value] forKey:akey];
}

/**
 * CGFloat 类型
 **/
- (void) setWaySafeCGFloat:(CGFloat) value forKey:(NSString *) akey
{
    [self setObject:[NSNumber numberWithFloat:value] forKey:akey];
}

/**
 * CGPoint 类型
 **/
- (void) setWaySafeCGPoint:(CGPoint) value forKey:(NSString *) akey
{
    [self setObject:NSStringFromCGPoint(value) forKey:akey];
}

/**
 * CGSize 类型
 **/
- (void) setWaySafeCGSize:(CGSize) value forKey:(NSString *) akey
{
    [self setObject:NSStringFromCGSize(value) forKey:akey];
}

/**
 * CGRect 类型
 **/
- (void) setWaySafeCGRect:(CGRect) value forKey:(NSString *) akey
{
    [self setObject:NSStringFromCGRect(value) forKey:akey];
}

@end


