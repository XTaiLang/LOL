//
//  HTTPRequestManager.h
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import <Foundation/Foundation.h>

//返回的Block
typedef void(^ResultBlock)(id responseObj, NSError *error);
typedef int a;
#define aa int

/*
 *  block: 匿名函数指针
 */

@interface HTTPRequestManager : NSObject
{
    a b;
    aa c;
}
//单例
+ (HTTPRequestManager *)sharedManager;

/**
 *  GET请求
 *
 *  @param url        url
 *  @param parameters 参数
 *  @param result     返回结果的block
 */
- (void)GET:(NSString *)url parameters:(id)parameters result:(ResultBlock)result;











@end
