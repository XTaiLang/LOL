//
//  BaseViewController.m
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "BaseViewController.h"

#import "BaseCell.h" //cell
#import "BaseHeaderView.h" //headerView

#import "NewsDetailViewController.h" //新闻详情页

@interface BaseViewController ()
<UITableViewDataSource, UITableViewDelegate, MJRefreshBaseViewDelegate>

@end

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //显示
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//    //隐藏
//    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化
    _datas = [NSMutableArray array];
    _headerDatas = [NSMutableArray array];
    page = 1;
    
    
    //获取数据
    [self getDatas];
    
    //创建TableView
    [self initTableView];
}

#pragma  mark - 获取数据
/**
 *  获取数据
 */
-(void)getDatas
{
    NSLog(@"Base getDatas");
}

#pragma  mark - 创建TableView
/**
 *  创建TableView
 */
-(void)initTableView
{
    //tableView
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, kScreenWidth, kScreenHeight - 64 - 49) style:UITableViewStyleGrouped];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    
    //注册cell
    [_myTableView registerNib:[UINib nibWithNibName:@"BaseCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    //注册headerView
    [_myTableView registerNib:[UINib nibWithNibName:@"BaseHeaderView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"header"];
    
    
    //刷新头,刷新尾
    mjHeaderView = [[MJRefreshHeaderView alloc] initWithScrollView:_myTableView];
    mjFooterView = [[MJRefreshFooterView alloc] initWithScrollView:_myTableView];
    
    mjHeaderView.delegate = self;
    mjFooterView.delegate = self;
    
}

#pragma  mark - MJRefreshBaseViewDelegate
-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    //刷新头
    if (refreshView == mjHeaderView) {
        page = 1;
        [self getDatas];
    }
    //刷新尾
    else {
        page++;
        [self getDatas];
    }
}

#pragma  mark -- tableView 代理方法
//cell的数量
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //获取cell对应的数据
    BaseModel *model = _datas[indexPath.row];
    
    //传入数据model
    cell.model = model;
    
    return cell;
}

//cell的行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

//组头
//section headerView的高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

//headerView
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //headerview
    BaseHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    
    //传入数组数据
    headerView.headerDatas = _headerDatas;
    
    return headerView;
}

//footerView 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}

//选择cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseModel *model = _datas[indexPath.row];
    
    //进入新闻详情
    NewsDetailViewController *vc = [[NewsDetailViewController alloc] init];
    vc.newsId = model.lid; //传入新闻Id
    [self.navigationController pushViewController:vc animated:YES];
    
}











@end
