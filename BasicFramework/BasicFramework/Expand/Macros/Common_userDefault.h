//
//  Common_userDefault.h
//  CommonMacro
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

/**
 *  @brief 字典
 */

#ifndef Common_userDefault_h
#define Common_userDefault_h

//存储 对象
#define UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

//获取 对象
#define UserDefaultObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]\
}

//删除 对象
#define UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}



#endif /* Common_userDefault_h */
