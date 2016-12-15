//
//  XPObject.m
//  BasicFramework
//
//  Created by wszhg on 16/9/19.
//  Copyright © 2016年 Peng. All rights reserved.
//

#import "XPObject.h"
@interface XPObject()
@property (nonatomic, assign, readwrite) BOOL isBigEndian_self;//<！大端格式还是小端格式,针对的是自己

@end


@implementation XPObject

#pragma mark - attribute


#pragma mark - lifeCycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadDefault];
    }
    return self;
}

- (void)dealloc
{
    [self customDealloc];
}

#pragma mark - configure

- (void)loadDefault
{
    //默认大端格式
    _isBigEndian_goal = YES;
    _isBigEndian_self = [XPObject isBigEndian];
}

- (void)customDealloc
{

}

#pragma mark - function
/**
 *  @brief 是否是大端格式
 *
 *  @return YES = 大端， NO = 小端
 */
+ (BOOL) isBigEndian
{
    int a = 0x1234;
    // 通过将int强制类型转换成char单字节，通过判断其实存储位置
    char b = *(char *)&a;
    if (b == 0x12) {
        return YES;
    }
    return NO;
    
//    //联合体 union的存放顺序死所有的成员都从地地址开始存放，利用该特性就可以轻松获得CPU对内存采用的Little-endian还是Big-endian模式读写：
//    union NUM
//    {
//        int a;
//        char b;
//    } num;
//    
//    num.a = 0x1234;
//    if (num.b == 0x12) {
//        return YES;
//    }
//    return NO;
}


#pragma mark - swap
/**
 *  @brief bool 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) boolToDataWithValue:(BOOL) value
{
    NSMutableData *mData = [NSMutableData data];
    //大端格式转，高位开始
    [mData appendBytes:&value length:sizeof(BOOL)];
    return mData;
}

/**
 *  @brief Boolean 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) booleanToDataWithValue:(Boolean) value
{
    NSMutableData *mData = [NSMutableData data];
    [mData appendBytes:&value length:sizeof(Boolean)];
    return mData;
}

/**
 *  @brief char 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) charToDataWithValue:(char) value
{
    NSMutableData *mData = [NSMutableData data];
    [mData appendBytes:&value length:sizeof(char)];
    return mData;
}

/**
 *  @brief byte 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) byteToDataWithValue:(Byte) value
{
    NSMutableData *mData = [NSMutableData data];
    [mData appendBytes:&value length:sizeof(Byte)];
    return mData;
}

/**
 *  @brief short 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) shortToDataWithValue:(short) value
{
    NSMutableData *mData = [NSMutableData data];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            value = NSSwapHostShortToBig(value);
        } else {
            //目标 小端
            value = NSSwapHostShortToLittle(value);
        }
    }
    [mData appendBytes:&value length:sizeof(short)];
    return mData;
}

/**
 *  @brief int 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) intToDataWithValue:(int) value
{
    NSMutableData *mData = [NSMutableData data];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            value = NSSwapHostIntToBig(value);
        } else {
            //目标 小端
            value = NSSwapHostIntToLittle(value);
        }
    }
    return mData;
}

/**
 *  @brief  long int 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) longintToDataWithValue:(long int) value
{
    NSMutableData *mData = [NSMutableData data];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            value = NSSwapHostLongToBig(value);
        } else {
            //目标 小端
            value = NSSwapHostLongToLittle(value);
        }
    }
    return mData;
}


/**
 *  @brief  long long int 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) longlongintToDataWithValue:(long long int) value
{
    NSMutableData *mData = [NSMutableData data];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            value = NSSwapHostLongLongToBig(value);
        } else {
            //目标 小端
            value = NSSwapHostLongLongToLittle(value);
        }
    }
    return mData;
}

/**
 *  @brief float 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) floatToDataWithValue:(float) value
{
    NSMutableData *mData = [NSMutableData data];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            //            value = NSSwapBigFloatToHost(NSSwapHostFloatToBig(value));
            value = NSSwapBigFloatToHost(NSConvertHostFloatToSwapped(value));
        } else {
            //目标 小端
            //            value = NSSwapLittleFloatToHost(NSSwapHostFloatToLittle(value));
            value = NSSwapLittleFloatToHost(NSConvertHostFloatToSwapped(value));
        }
    }
    return mData;
}


/**
 *  @brief double 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) doubleToDataWithValue:(double) value
{
    NSMutableData *mData = [NSMutableData data];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            //value = NSSwapBigDoubleToHost(NSSwapHostDoubleToBig(value));
            value = NSSwapBigDoubleToHost(NSConvertHostDoubleToSwapped(value));
        } else {
            //目标 小端
            //            value = NSSwapLittleDoubleToHost(NSSwapHostDoubleToLittle(value));
            value = NSSwapLittleDoubleToHost(NSConvertHostDoubleToSwapped(value));
        }
    }
    return mData;
}

/**
 *  @brief NSString 转 data
 *
 *  @param value 值
 *
 *  @return data
 */
- (NSData *) stringToDataWithValue:(NSString *) value
{
    NSMutableData *mData = [NSMutableData data];
//    if (_isBigEndian_self == _isBigEndian_goal) {
//        
//    } else {
//        if (_isBigEndian_goal == YES) {
//            //目标 大端
//        } else {
//            //目标 小端
//        }
//    }
    
    [mData appendData:[value dataUsingEncoding:NSUTF8StringEncoding]];
    return mData;
}




/**
 *  @brief data 转 NSString
 *
 *  @param data 二进制数据流
 *
 *  @return NSString
 */
- (NSString *) readStringWithData:(NSData *) data
{
    if (data == nil || data.length == 0) {
        return nil;
    }
    NSString *value = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return value;
}


/**
 *  @brief data 转 double
 *
 *  @param data 二进制数据流
 *
 *  @return double
 */
- (double) readDoubleWithData:(NSData *) data
{
    double value = 0;
    if (data == nil || data.length == 0 || data.length < sizeof(double)) {
        return value;
    }
    
    [data getBytes:&value length:sizeof(double)];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            //value = NSSwapBigDoubleToHost(NSSwapHostDoubleToBig(value));
            value = NSSwapBigDoubleToHost(NSConvertHostDoubleToSwapped(value));
        } else {
            //目标 小端
//            value = NSSwapLittleDoubleToHost(NSSwapHostDoubleToLittle(value));
            value = NSSwapLittleDoubleToHost(NSConvertHostDoubleToSwapped(value));
        }
    }
    return value;
}


/**
 *  @brief data 转 float
 *
 *  @param data 二进制数据流
 *
 *  @return float
 */
- (float) readFloatWithData:(NSData *) data
{
    float value = 0;
    if (data == nil || data.length == 0 || data.length < sizeof(float)) {
        return value;
    }
    
    [data getBytes:&value length:sizeof(float)];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
//            value = NSSwapBigFloatToHost(NSSwapHostFloatToBig(value));
            value = NSSwapBigFloatToHost(NSConvertHostFloatToSwapped(value));
        } else {
            //目标 小端
//            value = NSSwapLittleFloatToHost(NSSwapHostFloatToLittle(value));
            value = NSSwapLittleFloatToHost(NSConvertHostFloatToSwapped(value));
        }
    }
    return value;
}

/**
 *  @brief data 转 long long int
 *
 *  @param data 二进制数据流
 *
 *  @return long long int
 */
- (long long int) readLonglongintWithData:(NSData *) data
{
    long long int value = 0;
    if (data == nil || data.length == 0 || data.length < sizeof(long long int)) {
        return value;
    }
    
    [data getBytes:&value length:sizeof(long long int)];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            value = NSSwapBigLongLongToHost(value);
        } else {
            //目标 小端
            value = NSSwapLittleLongLongToHost(value);
        }
    }
    return value;
}

/**
 *  @brief data 转 long int
 *
 *  @param data 二进制数据流
 *
 *  @return long int
 */
- (long int) readLongintWithData:(NSData *) data
{
    long int value = 0;
    if (data == nil || data.length == 0 || data.length < sizeof(long int)) {
        return value;
    }
    
    [data getBytes:&value length:sizeof(long int)];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            value = NSSwapBigLongToHost(value);
        } else {
            //目标 小端
            value = NSSwapLittleLongToHost(value);
        }
    }
    return value;
}

/**
 *  @brief data 转 int
 *
 *  @param data 二进制数据流
 *
 *  @return  int
 */
- (int) readIntWithData:(NSData *) data
{
    int value = 0;
    if (data == nil || data.length == 0 || data.length < sizeof(int)) {
        return value;
    }
    
    [data getBytes:&value length:sizeof(int)];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            value = NSSwapBigIntToHost(value);
        } else {
            //目标 小端
            value = NSSwapLittleIntToHost(value);
        }
    }
    return value;
}


/**
 *  @brief data 转 short
 *
 *  @param data 二进制数据流
 *
 *  @return  short
 */
- (short) readShortWithData:(NSData *) data
{
    short value = 0;
    if (data == nil || data.length == 0 || data.length < sizeof(short)) {
        return value;
    }
    
    [data getBytes:&value length:sizeof(short)];
    if (_isBigEndian_self == _isBigEndian_goal) {
        
    } else {
        if (_isBigEndian_goal == YES) {
            //目标 大端
            value = NSSwapBigShortToHost(value);
        } else {
            //目标 小端
            value = NSSwapLittleShortToHost(value);
        }
    }
    return value;
}

/**
 *  @brief data 转 char
 *
 *  @param data 二进制数据流
 *
 *  @return  char
 */
- (char) readCharWithData:(NSData *) data
{
    char value = 0;
    if (data == nil || data.length == 0 || data.length < sizeof(char)) {
        return value;
    }
    
    [data getBytes:&value length:sizeof(char)];
    return value;
}

/**
 *  @brief data 转 Byte
 *
 *  @param data 二进制数据流
 *
 *  @return  Byte
 */
- (Byte) readByteWithData:(NSData *) data
{
    Byte value = 0;
    if (data == nil || data.length == 0 || data.length < sizeof(Byte)) {
        return value;
    }
    
    [data getBytes:&value length:sizeof(Byte)];
    return value;
}

/**
 *  @brief data 转 Boolean
 *
 *  @param data 二进制数据流
 *
 *  @return  Boolean
 */
- (Boolean) readBooleanWithData:(NSData *) data
{
    Boolean value = 0;
    if (data == nil || data.length == 0 || data.length < sizeof(Boolean)) {
        return value;
    }
    
    [data getBytes:&value length:sizeof(Boolean)];
    return value;
}

/**
 *  @brief data 转 BOOL
 *
 *  @param data 二进制数据流
 *
 *  @return  BOOL
 */
- (BOOL) readBOOLWithData:(NSData *) data
{
    BOOL value = 0;
    if (data == nil || data.length == 0 || data.length < sizeof(BOOL)) {
        return value;
    }
    
    [data getBytes:&value length:sizeof(BOOL)];
    return value;
}

@end
