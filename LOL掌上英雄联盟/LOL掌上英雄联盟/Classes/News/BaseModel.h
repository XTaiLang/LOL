//
//  BaseModel.h
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "JSONModel.h"

@interface BaseModel : JSONModel


@property(nonatomic, copy)NSString *lid; //id
@property(nonatomic, copy)NSString *title;

@property(nonatomic, copy)NSString *icon;
@property(nonatomic, copy)NSString *subTitle; //short



@end



