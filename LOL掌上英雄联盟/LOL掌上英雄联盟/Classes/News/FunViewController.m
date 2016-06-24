//
//  FunViewController.m
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "FunViewController.h"

@interface FunViewController ()

@end

@implementation FunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma  mark - 获取数据
-(void)getDatas
{
    //url
    NSString *url = [NSString stringWithFormat:kGreatUrlString, page];
    
    //GET
    [[HTTPRequestManager sharedManager] GET:url parameters:nil result:^(id responseObj, NSError *error) {
        
        if (error) {
            NSLog(@"数据获取失败:%@", error);
            return ;
        }
        
        
        //下拉刷新时,先删除旧数据
        if (page == 1) {
            [_datas removeAllObjects];
            [_headerDatas removeAllObjects];
        }
        
        //获取数据成功
        
        //result
        NSArray *resultArr = responseObj[@"result"];
        
        for (NSDictionary *dict in resultArr) {
            
            BaseModel *model = [[BaseModel alloc] initWithDictionary:dict error:nil];
            [_datas addObject:model];
        }
        
        //recomm
        NSArray *recommArr = responseObj[@"recomm"];
        
        for (NSDictionary *dict in recommArr) {
            
            BaseHeaderModel *model = [[BaseHeaderModel alloc] initWithDictionary:dict error:nil];
            [_headerDatas addObject:model];
        }
        
        //刷新tableView
        [self.myTableView reloadData];
        
        //结束刷新动画
        [mjHeaderView endRefreshing];
        [mjFooterView endRefreshing];
        
    }];
}


@end
