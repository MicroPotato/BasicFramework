//
//  NSObject+Runtime_Coder.m
//  Learn_runtime
//
//  Created by txp on 16/5/6.
//  Copyright © 2016年 Peng. All rights reserved.
//

#import "NSObject+Runtime_Coder.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <stdint.h>

@implementation NSObject (Runtime_Coder)

///解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if (self) {
        unsigned int count;
        objc_property_t *propertyList = class_copyPropertyList([self class], &count);
        for (int i = 0; i < count; i++) {
            objc_property_t property = propertyList[i];
            const char *name = property_getName(property);
            NSString *propertyName = [NSString stringWithUTF8String:name];
            NSString *propertyValue = [aDecoder decodeObjectForKey:propertyName];
            [self setValue:propertyValue forKey:propertyName];
        }
        free(propertyList);
    }
    return self;
}

///归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *name = property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        NSString *propertyValue = [self valueForKey:propertyName];
        [aCoder encodeObject:propertyValue forKey:propertyName];
    }
    free(propertyList);
}




@end
