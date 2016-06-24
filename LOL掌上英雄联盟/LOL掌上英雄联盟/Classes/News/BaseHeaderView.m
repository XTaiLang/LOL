//
//  BaseHeaderView.m
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "BaseHeaderView.h"

@implementation BaseHeaderView
{
    //scrollView
    __weak IBOutlet UIScrollView *myScrollView;
    
    //label
    __weak IBOutlet UILabel *nameLab;
    
}


-(void)awakeFromNib
{
    //设置nameLab的背景颜色
    nameLab.backgroundColor = kColor(0.9, 0.9, 0.9, 0.6);
    
    //设置代理
    myScrollView.delegate = self;
}

-(void)setHeaderDatas:(NSArray *)headerDatas
{
    _headerDatas = headerDatas;
    
    //设置contentSize
    myScrollView.contentSize = CGSizeMake(headerDatas.count * kScreenWidth, 0);
    
    
    //先移除旧UI
    for (UIView *view in myScrollView.subviews) {
        [view removeFromSuperview];
    }
    
    //添加新UI
    //赋值
    for (int i=0; i<headerDatas.count; i++) {
        
        BaseHeaderModel *model = headerDatas[i];
        NSString *imgSrc = [model.ban_img URLDecodedString]; //图片路径
        NSString *name = model.name; //名称
        
        //图片
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, 200)];
        [imgView sd_setImageWithURL:[NSURL URLWithString:imgSrc]];
        [myScrollView addSubview:imgView];
        
        //名称
        if (i == 0) {
            nameLab.text = name;
        }
    }
    
    
    
}


#pragma  mark - scrollView 代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    NSInteger index = offset.x / kScreenWidth;
    
    //
    BaseHeaderModel *model = _headerDatas[index];
    nameLab.text = model.name;
}








@end
