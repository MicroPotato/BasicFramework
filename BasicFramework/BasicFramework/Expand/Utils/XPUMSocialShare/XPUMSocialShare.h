//
//  XPUMSocialShare.h
//  CommonMacro
//
//  Created by txp on 16/3/23.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XPUMSocialShare : NSObject

+ (void)shareWithController:(UIViewController *)vc
                   iconData:(NSData *)iconData
                    content:(NSString *)title;

@end
