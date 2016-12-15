//
//  MJExtension.h
//  MJExtension
//
//  Created by mj on 14-1-15.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJTypeEncoding.h"
#import "NSObject+MJCoding.h"
#import "NSObject+MJMember.h"
#import "NSObject+MJKeyValue.h"

#define MJLogAllIvrs \
- (NSString *)description \
{ \
    return [self keyValues].description; \
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com