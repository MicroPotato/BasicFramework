//
//  XPUMSocialShare.m
//  CommonMacro
//
//  Created by txp on 16/3/23.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import "XPUMSocialShare.h"
#import "UMSocial.h"

@implementation XPUMSocialShare

+ (void)shareWithController:(UIViewController *)vc
                   iconData:(NSData *)iconData
                    content:(NSString *)title
{
//    [UMSocialSnsService presentSnsIconSheetView:vc
//                                         appKey:UMAppKey
//                                      shareText:title
//                                     shareImage:iconData
//                                shareToSnsNames:@[UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,UMShareToQzone,UMShareToEmail,UMShareToSms]
//                                       delegate:nil];
    
    [UMSocialSnsService presentSnsIconSheetView:vc
                                         appKey:UMAppKey
                                      shareText:title
                                     shareImage:iconData
                                shareToSnsNames:@[UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,UMShareToQzone,UMShareToEmail,UMShareToSms]
                                       delegate:nil];
}

@end
