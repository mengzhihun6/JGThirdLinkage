//
//  JGThirdLinkageOC.m
//  JGThirdLinkage
//
//  Created by spring on 2020/10/31.
//  Copyright © 2020 spring. All rights reserved.
//

#import "JGThirdLinkageOC.h"
#import "ZYChooseBrandView.h"

@interface JGThirdLinkageOC ()

@end

@implementation JGThirdLinkageOC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZYChooseBrandView *BrandV = [ZYChooseBrandView new];
    
    [self.view addSubview:BrandV];
    
    [BrandV mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).mas_offset(SJHeight);
        make.height.equalTo(@(kHeightScale(40)));
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
