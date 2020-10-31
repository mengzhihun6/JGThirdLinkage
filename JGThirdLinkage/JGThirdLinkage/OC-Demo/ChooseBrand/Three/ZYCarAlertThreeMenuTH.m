//
//  ZYCarAlertThreeMenuTH.m
//  CarPartMall
//
//  Created by spring on 2020/9/30.
//  Copyright © 2020 spring. All rights reserved.
//

#import "ZYCarAlertThreeMenuTH.h"

@interface ZYCarAlertThreeMenuTH ()

/* 全部*/
@property (nonatomic, strong) UILabel *TitleLbl;

@end

@implementation ZYCarAlertThreeMenuTH


- (void)configUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    _TitleLbl = [UILabel new];
    _TitleLbl.font = JGFont(kWidthScale(13));
    _TitleLbl.textColor = JGHexColor(@"#343434");
    _TitleLbl.text = @"全部";
        
    
    UIView *Line = [UIView new];
    Line.backgroundColor = JGHexColor(@"#E6E6E6");
    
    
    [self addSubview:_TitleLbl];
    [self addSubview:Line];

    
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




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
