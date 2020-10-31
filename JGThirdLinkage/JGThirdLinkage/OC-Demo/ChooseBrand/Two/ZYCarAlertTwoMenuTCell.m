//
//  ZYCarAlertTwoMenuTCell.m
//  CarPartMall
//
//  Created by spring on 2020/9/30.
//  Copyright © 2020 spring. All rights reserved.
//

#import "ZYCarAlertTwoMenuTCell.h"

@interface ZYCarAlertTwoMenuTCell ()

/* 菜单标题*/
@property (nonatomic, strong) UILabel *TitleLbl;

@property (nonatomic, strong) UIImageView *Arrow;


@end



@implementation ZYCarAlertTwoMenuTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)configUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _TitleLbl = [UILabel new];
    _TitleLbl.font = JGFont(kWidthScale(13));
    _TitleLbl.textColor = JGHexColor(@"#343434");
    _TitleLbl.numberOfLines = 2;
    _TitleLbl.text = @"长轴距A型轿车";
    
    _Arrow = [UIImageView new];
    _Arrow.image = JGImage(@"choose_arrow_right");
    
    
    UIView *Line = [UIView new];
    Line.backgroundColor = JGHexColor(@"#E6E6E6");
    
    
    [self.contentView addSubview:_TitleLbl];
    [self.contentView addSubview:_Arrow];
    [self.contentView addSubview:Line];

    
    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(10);
        make.right.equalTo(_Arrow.mas_left);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_Arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).mas_offset(-4);
        make.width.height.equalTo(@(kWidthScale(22)));
    }];
    
    [Line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(10);
        make.right.equalTo(self.mas_right).mas_offset(-10);
        make.bottom.equalTo(self.mas_bottom);
        make.height.equalTo(@(0.5));
    }];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    _TitleLbl.textColor = selected ? JGHexColor(@"#FC1E38") : JGHexColor(@"#343434");    
}


@end
