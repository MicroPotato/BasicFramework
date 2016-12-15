//
//  Common_block_self.h
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

/**
 *  @brief block 时 self 引用
 */

#ifndef Common_block_self_h
#define Common_block_self_h

// weak self
#define SELF_WEAK __weak typeof(self) weakSelf = self
// strong self
//#define SELF_STRONG __strong __typeof__(self) strongSelf = weakSelf
#define SELF_STRONG __strong typeof(weakSelf) strongSelf = weakSelf


#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type)  __strong typeof(type) type = weak##type;

#endif /* Common_block_self_h */
