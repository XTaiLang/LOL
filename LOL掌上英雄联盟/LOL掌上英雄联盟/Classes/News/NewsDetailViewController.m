//
//  NewsDetailViewController.m
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //隐藏tabbar
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建导航栏
    [self createNavBar];
    
    //url
    NSString *url = [NSString stringWithFormat:kNewsDetailUrlString, _newsId];
    
    //UIWebView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]]; //加载网页
    [self.view addSubview:webView];
    
}

/**
 *  创建导航栏
 */
-(void)createNavBar
{
    //背景图片
    UIImageView *navBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    navBgImgView.image = [UIImage imageNamed:@"nav_bar_bg_for_seven"];
    navBgImgView.userInteractionEnabled = YES;
    [self.view addSubview:navBgImgView];
    
    //标题
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, kScreenWidth-200, 44)];
    titleLab.text = @"新闻详情";
    titleLab.textColor = [UIColor whiteColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [navBgImgView addSubview:titleLab];
    
    //返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 27, 60, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"nav_btn_back_normal"] forState:0];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [navBgImgView addSubview:backBtn];
    
}

/**
 *  返回
 */
-(void)backBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}










@end
