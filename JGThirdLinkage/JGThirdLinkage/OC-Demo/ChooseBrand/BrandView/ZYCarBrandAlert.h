//
//  ZYCarBrandAlert.h
//  CarPartMall
//
//  Created by spring on 2020/9/30.
//  Copyright © 2020 spring. All rights reserved.
//

#import "ZYBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYCarBrandAlert : ZYBaseView

@property (nonatomic, copy) ReturnBackInfo BackInfo;

@property (nonatomic, copy) ReturnBackInfo CloseInfo;

- (instancetype)initWithRelyonView:(UIView *)view;

- (void)ShowAlert;

- (void)HideAlert;


@end

NS_ASSUME_NONNULL_END
