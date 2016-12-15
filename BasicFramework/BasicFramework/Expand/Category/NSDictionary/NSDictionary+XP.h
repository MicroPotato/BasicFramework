//
//  NSDictionary+XP.h
//  CommonMacro
//
//  Created by wszhg on 16/3/22.
//  Copyright (c) 2016年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (XP)

@end

//-------------------  convent jsongstring -------------------
@interface NSDictionary (JsonString)
/**
 * 字典转json
 **/
-(NSString *)jsonString;

@end


//-------------------  dictionary merge -------------------
@interface NSDictionary (Merge)
/**
 * 求字典的并集
 */
+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1
                                 with:(NSDictionary *)dict2;

/**
 * 求字典的并集
 */
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict;

@end


//------------------- array safe access -----------------------
@interface NSDictionary (SafeAccess)
/**
 * NSString 类型
 **/
- (NSString *) stringSafeForKey:(id) aKey;

/**
 * NSNumber 类型
 **/
- (NSNumber *) numberSafeForKey:(id) aKey;

/**
 * NSArray 类型
 **/
- (NSArray *) arraySafeForKey:(id) aKey;

/**
 * NSDictionary 类型
 **/
- (NSDictionary *) dictionarySafeForKey:(id) aKey;

/**
 * NSInteger 类型
 **/
- (NSInteger ) integerSafeForKey:(id) aKey;

/**
 * NSUInteger 类型
 **/
- (NSUInteger) uintegerSafeForKey:(id) aKey;

/**
 * BOOL 类型
 **/
- (BOOL) boolSafeForKey:(id) aKey;

/**
 * int16_t 类型
 **/
- (int16_t) int16SafeForKey:(id) aKey;

/**
 * int32_t 类型
 **/
- (int32_t) int32SafeForKey:(id) aKey;

/**
 * int64_t 类型
 **/
- (int64_t ) int64SafeForKey:(id) aKey;

/**
 * char 类型
 **/
- (char) charSafeForKey:(id) aKey;

/**
 * short 类型
 **/
- (short) shortSafeForKey:(id) aKey;

/**
 * float 类型
 **/
- (float) floatSafeForKey:(id) aKey;

/**
 * double 类型
 **/
- (double) doubleSafeForKey:(id) aKey;

/**
 * CGFloat 类型
 **/
- (CGFloat) CGFloatSafeForKey:(id) aKey;

/**
 * CGPoint 类型
 **/
- (CGPoint) CGPointSafeForKey:(id) aKey;

/**
 * CGSize 类型
 **/
- (CGSize) CGSizeSafeForKey:(id) aKey;

/**
 * CGRect 类型
 **/
- (CGRect) CGRectSafeForKey:(id) aKey;


@end



//------------------------NSMutableDictionary safe access ---------------------
@interface NSMutableDictionary (SafeAccess)
/**
 * id 类型
 **/
- (void) setWaySafeObject:(id) value forKey:(NSString *) akey;

/**
 * NSString 类型
 **/
- (void) setWaySafeString:(NSString *) value forKey:(NSString *) akey;

/**
 * NSNumber 类型
 **/
- (void) setWaySafeNumber:(NSNumber *) value forKey:(NSString *) akey;

/**
 * NSArray 类型
 **/
- (void) setWaySafeArray:(NSArray *) value forKey:(NSString *) akey;

/**
 * NSDictionary 类型
 **/
- (void) setWaySafeDictionary:(NSDictionary *) value forKey:(NSString *) akey;

/**
 * NSInteger 类型
 **/
- (void) setWaySafeInteget:(NSInteger) value forKey:(NSString *) akey;

/**
 * NSUInteger 类型
 **/
- (void) setWaySafeUInteger:(NSUInteger) value forKey:(NSString *) akey;

/**
 * BOOL 类型
 **/
- (void) setWaySafeBOOL:(BOOL) value forKey:(NSString *) akey;

/**
 * int16_t 类型
 **/
- (void) setWaySafeInt16:(int16_t) value forKey:(NSString *) akey;

/**
 * int32_t 类型
 **/
- (void) setWaySafeInt32:(int32_t) value forKey:(NSString *) akey;

/**
 * int64_t 类型
 **/
- (void) setWaySafeInt64:(int64_t) value forKey:(NSString *) akey;

/**
 * char 类型
 **/
- (void) setWaySafeChar:(char) value forKey:(NSString *) akey;

/**
 * short 类型
 **/
- (void) setWaySafeShort:(short) value forKey:(NSString *) akey;

/**
 * float 类型
 **/
- (void) setWaySafeFloat:(float) value forKey:(NSString *) akey;

/**
 * double 类型
 **/
- (void) setWaySafeDouble:(double) value forKey:(NSString *) akey;

/**
 * CGFloat 类型
 **/
- (void) setWaySafeCGFloat:(CGFloat) value forKey:(NSString *) akey;

/**
 * CGPoint 类型
 **/
- (void) setWaySafeCGPoint:(CGPoint) value forKey:(NSString *) akey;

/**
 * CGSize 类型
 **/
- (void) setWaySafeCGSize:(CGSize) value forKey:(NSString *) akey;

/**
 * CGRect 类型
 **/
- (void) setWaySafeCGRect:(CGRect) value forKey:(NSString *) akey;

@end



