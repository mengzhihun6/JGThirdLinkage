//
//  ZYCarAlertOneMenuTCell.m
//  CarPartMall
//
//  Created by spring on 2020/9/30.
//  Copyright © 2020 spring. All rights reserved.
//

#import "ZYCarAlertOneMenuTCell.h"

@interface ZYCarAlertOneMenuTCell ()

/* 菜单标题*/
@property (nonatomic, strong) UILabel *TitleLbl;

@end


@implementation ZYCarAlertOneMenuTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)configUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    
    _TitleLbl = [UILabel new];
    _TitleLbl.font = JGFontMedium_size(kWidthScale(16));
    _TitleLbl.textColor = JGHexColor(@"#343434");
    _TitleLbl.numberOfLines = 2;
    _TitleLbl.textAlignment = NSTextAlignmentCenter;
    _TitleLbl.text = @"雪佛兰";
    
    
    [self.contentView addSubview:_TitleLbl];
    
    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    _TitleLbl.textColor = selected ? JGHexColor(@"#FC1E38") : JGHexColor(@"#343434");

    self.backgroundColor = selected ? [UIColor whiteColor] : JGHexColor(@"#F5F5F5");
    
}

@end
