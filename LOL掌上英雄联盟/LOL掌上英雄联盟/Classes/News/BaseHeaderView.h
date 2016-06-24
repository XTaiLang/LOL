//
//  BaseHeaderView.h
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseHeaderView : UITableViewHeaderFooterView
<UIScrollViewDelegate>

//传入的头部数据的数组
@property(nonatomic, strong)NSArray *headerDatas;


@end
