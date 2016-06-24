//
//  BaseViewController.h
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
    //私有, 保护, 公有
    //保护
    NSMutableArray *_datas; //cell的数据
    NSMutableArray *_headerDatas; //header的数据
    
    MJRefreshHeaderView *mjHeaderView; //刷新头
    MJRefreshFooterView *mjFooterView; //刷新尾
    
    int page; //页码
}

//tableView
@property(nonatomic, strong)UITableView *myTableView;










@end
