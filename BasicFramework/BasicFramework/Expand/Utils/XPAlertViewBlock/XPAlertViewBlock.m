//
//  XPAlertViewBlock.m
//  BlockAlertViewDemo
//
//  Created by steven on 14/11/10.
//  Copyright (c) 2014年 fanpyi. All rights reserved.
//

#import "XPAlertViewBlock.h"

@interface XPAlertViewBlock ()
@property (nonatomic, copy) void (^cancelClick)();
@property (nonatomic, copy) void (^confirmClick)();

@end

@implementation XPAlertViewBlock

-(id)initWithTitle:(NSString *)title
           message:(NSString *)message
cancelButtonWithTitle:(NSString *)cancelTitle
       cancelBlock:(void (^)())cancelblock
confirmButtonWithTitle:(NSString *)confirmTitle
      confrimBlock:(void (^)())confirmBlock
{
    self=[super initWithTitle:title
                      message:message
                     delegate:self
            cancelButtonTitle:cancelTitle
            otherButtonTitles:confirmTitle, nil];
    if (self)
    {
        _cancelClick = [cancelblock copy];
        _confirmClick = [confirmBlock copy];
    }
    return self;
}


+(void)alertWithTitle:(NSString *)title
              message:(NSString *)message
cancelButtonWithTitle:(NSString *)cancelTitle
          cancelBlock:(void (^)())cancelblock
confirmButtonWithTitle:(NSString *)confirmTitle
         confrimBlock:(void (^)())confirmBlock
{
    XPAlertViewBlock *alert=[[XPAlertViewBlock alloc]initWithTitle:title
                                                       message:message
                                         cancelButtonWithTitle:cancelTitle
                                                   cancelBlock:cancelblock
                                        confirmButtonWithTitle:confirmTitle
                                                  confrimBlock:confirmBlock];
    [alert show];
}



#pragma mark UIAlertViewDelegate methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        if (_cancelClick)
        {
            _cancelClick();
        }
    }
    else if (buttonIndex == 2)
    {
        if (_confirmClick)
        {
            _confirmClick();
        }
    }
}






@end
