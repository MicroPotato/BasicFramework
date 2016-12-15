//
//  Common_singleton.h
//  CommonMacro
//
//  Created by txp on 15/11/2.
//  Copyright (c) 2015年 JiuMu. All rights reserved.
//
// 单例宏

#ifndef CommonMacro_Common_singleton_h
#define CommonMacro_Common_singleton_h

// @interface
#define singleton_interface(className) \
+ (className *)shared##className;

// @implementation
#define singleton_implementation(className) \
static className *_instance; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (className *)shared##className \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}

#endif
