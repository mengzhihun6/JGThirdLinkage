//
//  ZYCarAlertTwoMenu.m
//  CarPartMall
//
//  Created by spring on 2020/9/30.
//  Copyright © 2020 spring. All rights reserved.
//

#import "ZYCarAlertTwoMenu.h"
#import "ZYCarAlertTwoMenuTH.h"
#import "ZYCarAlertTwoMenuTCell.h"

@interface ZYCarAlertTwoMenu ()  <UITableViewDelegate, UITableViewDataSource>
/* tableView */
@property (nonatomic, strong)UITableView *tableView;


@end

static NSString * const ZYCarAlertTwoMenuTCellId = @"ZYCarAlertTwoMenuTCellId";


@implementation ZYCarAlertTwoMenu

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ZYCarAlertTwoMenuTCell class] forCellReuseIdentifier:ZYCarAlertTwoMenuTCellId];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
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
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYCarAlertTwoMenuTCell *cell = [tableView dequeueReusableCellWithIdentifier:ZYCarAlertTwoMenuTCellId forIndexPath:indexPath];
//    cell.Model = [self.secondGoodsClassifyList objectAtIndex:indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZYCarAlertTwoMenuTH *header = [ZYCarAlertTwoMenuTH new];
    return header;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
    if (self.BackInfo) {
        self.BackInfo(@"");
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kHeightScale(29);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kHeightScale(29);
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
