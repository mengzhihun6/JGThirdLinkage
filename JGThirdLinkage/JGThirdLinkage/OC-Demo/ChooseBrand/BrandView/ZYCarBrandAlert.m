//
//  ZYCarBrandAlert.m
//  CarPartMall
//
//  Created by spring on 2020/9/30.
//  Copyright © 2020 spring. All rights reserved.
//

#import "ZYCarBrandAlert.h"
#import "ZYCarAlertOneMenu.h"
#import "ZYCarAlertTwoMenu.h"
#import "ZYCarAlertThreeMenu.h"


@interface ZYCarBrandAlert ()<UIGestureRecognizerDelegate>
//品牌按钮
@property(nonatomic,strong) UIButton *BrandBtn;
/** 弹窗 */
@property(nonatomic,strong) UIView *alertView;
//一级分类
@property(nonatomic,strong) ZYCarAlertOneMenu *OneMenu;
//二级分类
@property(nonatomic,strong) ZYCarAlertTwoMenu *TwoMenu;
//三级分类
@property(nonatomic,strong) ZYCarAlertThreeMenu *ThreeMenu;
//重置
@property(nonatomic,strong) UIButton *ReSetBtn;
//确定
@property(nonatomic,strong) UIButton *SureBtn;

@end


@implementation ZYCarBrandAlert

- (instancetype)initWithRelyonView:(UIView *)view {
    if (self = [super init]) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        
        CGRect Rect = [view convertRect:view.bounds toView:[UIApplication sharedApplication].keyWindow];
        
        _BrandBtn = [[UIButton alloc] initWithFrame:Rect];
        [_BrandBtn addTarget:self action:@selector(HideAlert) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *CoverView = [UIView new];
        CoverView.backgroundColor = [UIColor colorWithWhite:0.01 alpha:0.4];
        
        _alertView = [UIView new];
        _alertView.backgroundColor = [UIColor whiteColor];
        
        UIView *TopLine = [UIView new];
        TopLine.backgroundColor = JGHexColor(@"#E6E6E6");
        
        WEAKSELF;
        _OneMenu = [ZYCarAlertOneMenu new];
        _OneMenu.BackInfo = ^(id data) {
            [weakSelf CarAlertOneMenuCell];
        };
        
        _TwoMenu = [ZYCarAlertTwoMenu new];
        _TwoMenu.hidden = YES;
        _TwoMenu.BackInfo = ^(id data) {
            [weakSelf CarAlertTwoMenu];
        };
        
        _ThreeMenu = [ZYCarAlertThreeMenu new];
        _ThreeMenu.hidden = YES;
        _ThreeMenu.BackInfo = ^(id data) {
            [weakSelf CarAlertThreeMenu];
        };
        
        _ReSetBtn = [UIButton new];
        _ReSetBtn.titleLabel.font = JGBoldFont(kWidthScale(16));
        [_ReSetBtn setTitle:@"重置" forState:UIControlStateNormal];
        [_ReSetBtn setTitleColor:JGHexColor(@"#343434") forState:UIControlStateNormal];
        _ReSetBtn.backgroundColor = [UIColor whiteColor];
        _ReSetBtn.layer.shadowColor = [UIColor colorWithRed:13/255.0 green:2/255.0 blue:2/255.0 alpha:0.06].CGColor;
        _ReSetBtn.layer.shadowOffset = CGSizeMake(0,0);
        _ReSetBtn.layer.shadowOpacity = 1;
        _ReSetBtn.layer.shadowRadius = 12;
        [_ReSetBtn addTarget:self action:@selector(ReSetBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        _SureBtn = [UIButton new];
        _SureBtn.backgroundColor = JGHexColor(@"#FC1E38");
        _SureBtn.titleLabel.font = JGBoldFont(kWidthScale(16));
        [_SureBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_SureBtn addTarget:self action:@selector(SureBtnClick) forControlEvents:UIControlEventTouchUpInside];

        
        [self addSubview:_BrandBtn];
        [self addSubview:CoverView];
        [self addSubview:_alertView];
        [_alertView addSubview:TopLine];
        [_alertView addSubview:_OneMenu];
        [_alertView addSubview:_ThreeMenu];
        [_alertView addSubview:_TwoMenu];
        [_alertView addSubview:_ReSetBtn];
        [_alertView addSubview:_SureBtn];
        
        
        CGFloat TopY = Rect.origin.y + Rect.size.height;
        [_alertView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).mas_offset(TopY);
            make.left.equalTo(self.mas_left);
            make.size.mas_equalTo(CGSizeMake(kDeviceWidth, kHeightScale(400)));
        }];
        
        [CoverView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.top.equalTo(_alertView.mas_top);
        }];
        
        [TopLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(_alertView);
            make.height.equalTo(@(0.5));
        }];
        
        [_OneMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_alertView.mas_left);
            make.top.equalTo(TopLine.mas_bottom);
            make.bottom.equalTo(_ReSetBtn.mas_top);
            make.width.equalTo(@(kWidthScale(97)));
        }];
        
        [_TwoMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_OneMenu);
            make.left.equalTo(_OneMenu.mas_right);
            make.width.equalTo(@(kWidthScale(278)));
        }];
        
        [_ThreeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_OneMenu);
            make.right.equalTo(_alertView.mas_right).mas_offset(-7);
            make.width.equalTo(@(kWidthScale(129)));
        }];
        
        CGFloat W = kDeviceWidth / 2.0;
        [_ReSetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(_alertView);
            make.size.mas_equalTo(CGSizeMake(W, kHeightScale(44)));
        }];
        
        [_SureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(_alertView);
            make.size.mas_equalTo(CGSizeMake(W, kHeightScale(44)));
        }];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        tap.delegate = self;
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap];
    }
    return self;
}

#pragma mark - UIGestureRecognizerDelegate
//    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    //    JGLog(@"%@", NSStringFromClass([touch.view class]));
    return ![NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"];
}

#pragma mark - 点击其他区域关闭
- (void)tapClick:(UITapGestureRecognizer *)tap {
    if( CGRectContainsPoint(_alertView.frame, [tap locationInView:self])) {
    }else {
        [self HideAlert];
    }
}

#pragma mark - 一级类别 Cell 点击 -
- (void)CarAlertOneMenuCell {
    
    self.TwoMenu.hidden = NO;
    self.ThreeMenu.hidden = YES;
    
    [self.TwoMenu mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(kWidthScale(278)));
    }];
    
}

#pragma mark - 二级类别 Cell 点击 -
- (void)CarAlertTwoMenu {
    
    self.ThreeMenu.hidden = NO;
    
    [self.TwoMenu mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(kWidthScale(135)));
    }];

}


#pragma mark - 三级类别 Cell 点击 -
- (void)CarAlertThreeMenu {
    
    
    
}

#pragma mark - 重置按钮 点击 -
- (void)ReSetBtnClick {
    
    
    
}

#pragma mark - 完成按钮 点击 -
- (void)SureBtnClick {
    
    if (self.BackInfo) {
        [self HideAlert];
        self.BackInfo(@"选中数据");
    }
    
}



#pragma mark - 弹出
-(void)ShowAlert {
    UIWindow *rootWindow = [UIApplication sharedApplication].keyWindow;
    [rootWindow addSubview:self];
    //    [self creatShowAnimation];
}

-(void)creatShowAnimation {
    self.alertView.transform = CGAffineTransformMakeScale(0.90, 0.90);
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
    }];
}

#pragma mark - 关闭弹窗 -
- (void)HideAlert {
    if (self.CloseInfo) {
        self.CloseInfo(@"关闭");
    }
    [self removeFromSuperview];
}

//- (void)dealloc {
//
//    JGLog(@"销毁了");
//    
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
