//
//  HTTPRequestManager.m
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "HTTPRequestManager.h"

@interface HTTPRequestManager ()
{
    AFHTTPRequestOperationManager *manager;
}
@end

@implementation HTTPRequestManager

//单例
+ (HTTPRequestManager *)sharedManager
{
    static HTTPRequestManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HTTPRequestManager alloc] init];
    });
    return instance;
}

//初始化
-(instancetype)init
{
    if (self = [super init]) {
        
        manager = [AFHTTPRequestOperationManager manager];
        
        //设置接收的数据内容类型为"text/html"
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
        //post body体中数据: {username=lisi&password=123456}
        //manager.requestSerializer = [AFJSONRequestSerializer  serializer];
        
    }
    return self;
}

//GET请求
- (void)GET:(NSString *)url parameters:(id)parameters result:(ResultBlock)result
{
    //GET请求
    [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //回传数据
        if (result) {
            result(responseObject, nil);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //回传错误信息
        if (result) {
            result(nil, error);
        }
    }];
    
}


//fun:是函数名, 也是指向函数的指针
int fun()
{
    return 1;
}















@end
