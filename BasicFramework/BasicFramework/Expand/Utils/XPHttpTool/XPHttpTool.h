//
//  XPHttpTool.h
//  CommonMacro
//
//  Created by txp on 16/3/23.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XPHttpTool : NSObject

/**
 * @brief 发送一个get请求
 * @prama  url 地址
 * @prama  params 参数列表
 * @prama  progress 进度
 * @prama success 成功回调
 * @prama failure 失败回调
 */
+ (void)get:(NSString *)url
     params:(NSDictionary *)params
    progess:(void(^)(NSProgress *)) progress
    success:(void (^)(id))success
    failure:(void (^)(NSError *))failure;

/**
 * @brief 发送一个get请求
 * @prama  url 地址
 * @prama  params 参数列表
 * @prama  progress 进度
 * @prama success 成功回调
 * @prama failure 失败回调
 */
+ (void)post:(NSString *)url
      params:(NSDictionary *)params
     progess:(void(^)(NSProgress *)) progress
     success:(void (^)(id))success
     failure:(void(^) (NSError *))failure;

@end
