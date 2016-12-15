//
//  XPHttpTool.m
//  CommonMacro
//
//  Created by txp on 16/3/23.
//  Copyright © 2016年 JiuMu. All rights reserved.
//

#import "XPHttpTool.h"
#import "AFNetworking.h"

@implementation XPHttpTool\
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
    failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *httpSessionManager = [AFHTTPSessionManager manager];
    [httpSessionManager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress)
        {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
            failure(error);
        }
    }];
}

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
     progess:(void(^)(NSProgress *downloadProgress)) progress
     success:(void (^)(id))success
     failure:(void(^) (NSError *error))failure
{
    AFHTTPSessionManager *httpSessionManager = [AFHTTPSessionManager manager];
    [httpSessionManager POST:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress)
        {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
            failure(error);
        }
    }];
}

@end
