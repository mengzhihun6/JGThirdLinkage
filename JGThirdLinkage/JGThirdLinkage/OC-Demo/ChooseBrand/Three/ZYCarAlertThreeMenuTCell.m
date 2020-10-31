//
//  ZYCarAlertThreeMenuTCell.m
//  CarPartMall
//
//  Created by spring on 2020/9/30.
//  Copyright © 2020 spring. All rights reserved.
//

#import "ZYCarAlertThreeMenuTCell.h"

@interface ZYCarAlertThreeMenuTCell ()

/* 菜单标题*/
@property (nonatomic, strong) UILabel *TitleLbl;

@end

@implementation ZYCarAlertThreeMenuTCell

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
    _TitleLbl.text = @"四驱六坐";
    
    UIView *Line = [UIView new];
    Line.backgroundColor = JGHexColor(@"#E6E6E6");
    
    
    [self.contentView addSubview:_TitleLbl];
    [self.contentView addSubview:Line];

    
    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(10);
        make.centerY.equalTo(self.mas_centerY);
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
