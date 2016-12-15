//
//  BaseViewController.m
//  BasicFramework
//
//  Created by txp on 16/9/6.
//  Copyright © 2016年 Peng. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

#pragma mark - lifecycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{

}

- (void)customDealloc
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.backBarTextIsBack) {
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    }
}

#pragma mark - config
- (void)loadDefault
{
    
}

#pragma mark - notification - keyboard

/**
 *  @brief 键盘已经展示
 *
 *  @param aNotification 通知
 */
- (void) keyboardDidShow:(NSNotification *)aNotification
{

}

/**
 *  @brief 键盘将要展示
 *
 *  @param aNotification 通知
 */
- (void) keyboardWillShow:(NSNotification *)aNotification
{
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    self.keyboarHeight = keyboardRect.size.height;
}

/**
 *  @brief 键盘将要隐藏
 *
 *  @param aNotification 通知
 */
- (void) keyboardWillHide:(NSNotification *)aNotification
{
    self.keyboarHeight = 0;
}

#pragma mark - function
/**
 *  @brief 添加键盘通知
 */
- (void) addKeyboardNotifications
{
    [NOTIFICATION_CENTER addObserver:self
                            selector:@selector(keyboardWillShow:)
                                name:UIKeyboardWillShowNotification
                              object:nil];
    
    [NOTIFICATION_CENTER addObserver:self
                            selector:@selector(keyboardDidShow:)
                                name:UIKeyboardDidShowNotification
                              object:nil];
    
    [NOTIFICATION_CENTER addObserver:self
                            selector:@selector(keyboardWillHide:)
                                name:UIKeyboardWillHideNotification
                              object:nil];
}

/**
 *  @brief 移除键盘通知
 */
- (void) removeKeyboardNotifications
{
    [NOTIFICATION_CENTER removeObserver:self
                                   name:UIKeyboardWillShowNotification
                                 object:nil];
    
    [NOTIFICATION_CENTER removeObserver:self
                                   name:UIKeyboardWillHideNotification
                                 object:nil];
    
    [NOTIFICATION_CENTER removeObserver:self
                                   name:UIKeyboardDidShowNotification
                                 object:nil];
}


@end
