//
//  XPAlertViewBlock.h
//  BlockAlertViewDemo
//
//  Created by steven on 14/11/10.
//  Copyright (c) 2014年 fanpyi. All rights reserved.
//

/*********  block 实现 *******/


#import <UIKit/UIKit.h>

@interface XPAlertViewBlock : UIAlertView<UIAlertViewDelegate>

+ (void)alertWithTitle:(NSString *)title
               message:(NSString *)message
 cancelButtonWithTitle:(NSString *)cancelTitle
           cancelBlock:(void (^)())cancelblock
confirmButtonWithTitle:(NSString *)confirmTitle
          confrimBlock:(void (^)())confirmBlock;


@end
