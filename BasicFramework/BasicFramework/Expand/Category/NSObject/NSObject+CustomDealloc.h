//
//  NSObject+CustomDealloc.h
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 手动需要释放的
@interface NSObject (CustomDealloc)

/**
 *  @brief 手动释放，在销毁对象前调用
 */
- (void) customDealloc;

@end
