//
//  NewsViewController.m
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "NewsViewController.h"

#import "SCNavTabBarController.h" //导航分栏控制器

#import "LastestViewController.h" //最新
#import "ActivityViewController.h" //活动
#import "GameViewController.h" //赛事
#import "VideoViewController.h" //视频

#import "FunViewController.h" //娱乐
#import "OfficialViewController.h" //官方
#import "BeautyViewController.h" //美女
#import "RaidersViewController.h" //攻略

@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // <1> 获取提示音路径
    NSString * path = [[NSBundle mainBundle] pathForResource:@"garen.mp3" ofType:nil];
    // <2> 将字符串路径转化为NSURL
    NSURL * url = [NSURL fileURLWithPath:path];
    
    // <3> 注册系统音频ID
    SystemSoundID ID;
    // <4> 创建系统音频
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &ID);
    // <5> 播放系统音频
    AudioServicesPlaySystemSound(ID);

    
    
    //隐藏自带的导航条
    self.navigationController.navigationBarHidden = YES;
    
    
    //最新
    LastestViewController *vc1 = [[LastestViewController alloc] init];
    vc1.title = @"最新";
    
    //活动
    ActivityViewController *vc2 = [[ActivityViewController alloc] init];
    vc2.title = @"活动";
    
    //赛事
    GameViewController *vc3 = [[GameViewController alloc] init];
    vc3.title = @"赛事";
    
    //视频
    VideoViewController *vc4 = [[VideoViewController alloc] init];
    vc4.title = @"视频";
    
    
    //娱乐
    FunViewController *vc5 = [[FunViewController alloc] init];
    vc5.title = @"娱乐";
    
    //官方
    OfficialViewController *vc6 = [[OfficialViewController alloc] init];
    vc6.title = @"官方";
    
    //美女
    BeautyViewController *vc7 = [[BeautyViewController alloc] init];
    vc7.title = @"美女";
    
    //攻略
    RaidersViewController *vc8 = [[RaidersViewController alloc] init];
    vc8.title = @"攻略";
    
    //创建导航分栏控制器
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
    
    navTabBarController.subViewControllers = @[vc1, vc2, vc3, vc4, vc5, vc6, vc7, vc8];
    
   // navTabBarController.navTabBarColor = kColor(24/255.0, 28/255.0, 38/255.0, 0.9); //设置导航栏的颜色
    
    [navTabBarController addParentController:self];
    
    //设置背景颜色
    self.view.backgroundColor = kColor(24/255.0, 28/255.0, 38/255.0, 0.9);
    
}















@end
