//
//  CustomTabBarController.m
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "CustomTabBarController.h"

#import "NewsViewController.h" //新闻
#import "HerosViewController.h" //英雄
#import "InfosViewController.h" //资料
#import "SettingViewController.h" //设置

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //新闻
    NewsViewController *newsVC = [[NewsViewController alloc] init];
    UINavigationController *newsNav = [[UINavigationController alloc] initWithRootViewController:newsVC];
    
    //英雄
    HerosViewController *herosVC = [[HerosViewController alloc] init];
    UINavigationController *herosNav = [[UINavigationController alloc] initWithRootViewController:herosVC];
    
    //资料
    InfosViewController *infosVC = [[InfosViewController alloc] init];
    UINavigationController *infosNav = [[UINavigationController alloc] initWithRootViewController:infosVC];
    
    //设置
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    UINavigationController *settingNav = [[UINavigationController alloc] initWithRootViewController:settingVC];
    
    
    //给TabBarController设置viewControllers
    self.viewControllers = @[newsNav, herosNav, infosNav, settingNav];
    
    //定制tabbarController的Item
    [self customTabbarItems];
}

/**
 *  定制tabbarController的Item
 */
-(void)customTabbarItems
{
    
    NSArray *titles = @[@"新闻", @"英雄", @"资料", @"设置"]; //标题
    
    NSArray *normalImageNames = @[@"tab_icon_news_normal", @"tab_icon_friend_normal", @"tab_icon_quiz_normal", @"tab_icon_more_normal"]; //未选择状态的图片
    
    NSArray *seletedImageNames = @[@"tab_icon_news_press", @"tab_icon_friend_press", @"tab_icon_quiz_press", @"tab_icon_more_press"]; //选择状态的图片
    
    //遍历
    for (int i=0; i<self.viewControllers.count; i++) {
        
        //item
        RDVTabBarItem *item = self.tabBar.items[i];
        
        //图片名称
        UIImage *normalImage = [UIImage imageNamed:normalImageNames[i]];
        UIImage *selectedImage = [UIImage imageNamed:seletedImageNames[i]];
        
        //设置选择图片和未选择图片
        [item setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:normalImage];
        
        
        //title
        item.unselectedTitleAttributes = @{NSFontAttributeName:kFont(11), NSForegroundColorAttributeName:kColor(166/255.0, 172/255.0, 182/255.0, 1)};
        item.selectedTitleAttributes = @{NSFontAttributeName:kFont(13), NSForegroundColorAttributeName:kColor(52/255.0, 116/255.0, 181/255.0, 1)};
        
        item.title = titles[i];
        
    }
    
    
}


















@end
