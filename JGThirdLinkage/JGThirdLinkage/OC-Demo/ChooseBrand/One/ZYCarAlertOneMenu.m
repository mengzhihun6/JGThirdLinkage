//
//  ZYCarAlertOneMenu.m
//  CarPartMall
//
//  Created by spring on 2020/9/30.
//  Copyright © 2020 spring. All rights reserved.
//

#import "ZYCarAlertOneMenu.h"
#import "ZYCarAlertOneMenuTCell.h"

@interface ZYCarAlertOneMenu ()  <UITableViewDelegate, UITableViewDataSource>
/* tableView */
@property (nonatomic, strong)UITableView *tableView;

@end

static NSString * const ZYCarAlertOneMenuTCellId = @"ZYCarAlertOneMenuTCellId";

@implementation ZYCarAlertOneMenu

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZYCarAlertOneMenuTCell class] forCellReuseIdentifier:ZYCarAlertOneMenuTCellId];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = JGHexColor(@"#F5F5F5");
    }
    return _tableView;
}

//配置UI
- (void)configUI {
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYCarAlertOneMenuTCell *cell = [tableView dequeueReusableCellWithIdentifier:ZYCarAlertOneMenuTCellId forIndexPath:indexPath];
//    cell.Model = [self.secondGoodsClassifyList objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
    if (self.BackInfo) {
        self.BackInfo(@"");
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kHeightScale(59);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
