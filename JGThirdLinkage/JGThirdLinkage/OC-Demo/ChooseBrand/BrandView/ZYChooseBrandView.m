//
//  ZYChooseBrandView.m
//  CarPartMall
//
//  Created by spring on 2020/9/30.
//  Copyright © 2020 spring. All rights reserved.
//

#import "ZYChooseBrandView.h"
#import "ZYCarBrandAlert.h"

@interface ZYChooseBrandViewBtn : UIButton

@end

@implementation ZYChooseBrandViewBtn

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
//        self.titleLabel.font = JGBoldFont(kWidthScale(14));
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
//        [self setTitleColor:JGHexColor(@"#343434") forState:UIControlStateNormal];
        [self setTitleColor:JGHexColor(@"#FC1E38") forState:UIControlStateSelected];
        [self setImage:JGImage(@"choose_down_arrow") forState:UIControlStateNormal];
        [self setImage:JGImage(@"choose_up_arrow") forState:UIControlStateSelected];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if ([self.titleLabel.text isEqualToString:@"选择品牌"]) {
        self.titleLabel.font = JGBoldFont(kWidthScale(14));
        [self setTitleColor:JGHexColor(@"#343434") forState:UIControlStateNormal];
    }else {
        self.titleLabel.font = JGFont(kWidthScale(14));
        [self setTitleColor:JGHexColor(@"#787878") forState:UIControlStateNormal];
    }
        
    CGFloat h = self.frame.size.height;
    
    CGFloat titleW = [UILabel getWidthWithTitle:self.titleLabel.text font:self.titleLabel.font];
    CGFloat MaxW = kDeviceWidth - kWidthScale(35) - kWidthScale(22);
    
    if (titleW > MaxW) {
        titleW = MaxW;
    }
    
    CGFloat y = (h - kWidthScale(22)) / 2.0;
    self.titleLabel.frame = CGRectMake(kWidthScale(17), 0, titleW, h);

    self.imageView.frame = CGRectMake(self.titleLabel.right, y, kWidthScale(22), kWidthScale(22));
}

@end


@interface ZYChooseBrandView ()

@property (nonatomic, strong) ZYChooseBrandViewBtn *BrandBtn;

@end

@implementation ZYChooseBrandView

- (void)configUI {
    
    self.backgroundColor = [UIColor whiteColor];
    
    _BrandBtn = [ZYChooseBrandViewBtn new];
    [_BrandBtn setTitle:@"选择品牌" forState:UIControlStateNormal];
    [_BrandBtn addTarget:self action:@selector(BrandBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_BrandBtn];
    
    [_BrandBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}


- (void)BrandBtnClick:(UIButton *)btn {
    
    btn.selected = YES;
    
    
    ZYCarBrandAlert *alert = [[ZYCarBrandAlert alloc] initWithRelyonView:btn];
//    WEAKSELF;
    alert.BackInfo = ^(id data) {
        [btn setTitle:@"奔驰汽车-长轴距A型轿车-2016" forState:UIControlStateNormal];
    };
    
    alert.CloseInfo = ^(id data) {
        btn.selected = NO;
    };
    
    [alert ShowAlert];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
