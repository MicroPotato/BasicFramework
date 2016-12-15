//
//  Common_gcd.h
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#ifndef Common_gcd_h
#define Common_gcd_h

/// 获取全局队列，默认的
#define GCDWithGlobal(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
/// 获取主队列
#define GCDWithMain(block) dispatch_async(dispatch_get_main_queue(),block)

#endif /* Common_gcd_h */
