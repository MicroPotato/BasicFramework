//
//  Common_RuntimeCoder.h
//  CommonMacro
//
//  Created by txp on 16/5/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

// 用runtime 机制实现归档和解档的宏

#import <objc/runtime.h>
#import <objc/message.h>
#import <stdint.h>

#ifndef Common_RuntimeCoder_h
#define Common_RuntimeCoder_h

#define RUNTIME_CODER \
- (instancetype)initWithCoder:(NSCoder *)aDecoder\
{\
    self = [self init];\
    if (self) {\
        unsigned int count;\
        objc_property_t *propertyList = class_copyPropertyList([self class], &count);\
        for (int i = 0; i < count; i++) {\
            objc_property_t property = propertyList[i];\
            const char *name = property_getName(property);\
            NSString *propertyName = [NSString stringWithUTF8String:name];\
            NSString *propertyValue = [aDecoder decodeObjectForKey:propertyName];\
            [self setValue:propertyValue forKey:propertyName];\
        }\
        free(propertyList);\
    }\
    return self;\
}\
- (void)encodeWithCoder:(NSCoder *)aCoder\
{\
    unsigned int count;\
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);\
    for (int i = 0; i < count; i++) {\
        objc_property_t property = propertyList[i];\
        const char *name = property_getName(property);\
        NSString *propertyName = [NSString stringWithUTF8String:name];\
        NSString *propertyValue = [self valueForKey:propertyName];\
        [aCoder encodeObject:propertyValue forKey:propertyName];\
    }\
    free(propertyList);\
}



#endif /* Common_RuntimeCoder_h */
