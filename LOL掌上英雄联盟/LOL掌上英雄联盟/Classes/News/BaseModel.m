//
//  BaseModel.m
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

//key值转换
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"lid", @"short":@"subTitle"}];
}



@end



