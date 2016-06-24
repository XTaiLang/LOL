//
//  BaseCell.m
//  LOL掌上英雄联盟
//
//  Created by iJeff on 15/11/16.
//  Copyright (c) 2015年 iJeff. All rights reserved.
//

#import "BaseCell.h"

@interface BaseCell ()
{
    //图片
    __weak IBOutlet UIImageView *imgView;
    
    //标题
    __weak IBOutlet UILabel *titleLab;
    
    //副标题
    __weak IBOutlet UILabel *subTitleLab;
    
}

@end

@implementation BaseCell

- (void)awakeFromNib {
    
}

//重写model的set方法
-(void)setModel:(BaseModel *)model
{
    _model = model;
    
    //赋值
    [imgView sd_setImageWithURL:[NSURL URLWithString:model.icon]]; //图片
    titleLab.text = model.title;
    subTitleLab.text = model.subTitle;
    
}













@end
