//
//  LCTableStyleViewController.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/16.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCTableStyleViewController.h"
#import "UITableView+LCAdd.h"
#import "LCActionCellViewModel.h"

@interface LCTableStyleViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray<NSDictionary *> *titleArray;

@end

@implementation LCTableStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"1个section,多个row";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configDatas];
}

- (void)configDatas {
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < self.titleArray.count; i++) {
        NSDictionary *dic = self.titleArray[i];
        
        if (i == 0) {
            LCActionCellViewModel *cellVM = [[LCActionCellViewModel alloc] init];
            cellVM.showBottomLine = YES;
            cellVM.bottomLineInsets = UIEdgeInsetsMake(0, 16, 0, 16);
            cellVM.textLeft = 50;
            cellVM.textStr = dic[@"title"];
            [dataArray addObject:cellVM];
            
        } else if (i == 1) {
            LCActionCellViewModel *cellVM = [[LCActionCellViewModel alloc] init];
            cellVM.showBottomLine = YES;
            cellVM.bottomLineInsets = UIEdgeInsetsMake(0, 16, 0, 0);
            cellVM.indicatorImage = [UIImage imageNamed:@"arrow_right"];
            cellVM.textStr = dic[@"title"];
            cellVM.cellHeight = 80;
            [dataArray addObject:cellVM];
        
        } else if (i == 2) {
            LCActionCellViewModel *cellVM = [[LCActionCellViewModel alloc] init];
            cellVM.showBottomLine = YES;
            cellVM.textColor = [UIColor redColor];
            cellVM.textAlignment = NSTextAlignmentCenter;
            cellVM.textStr = dic[@"title"];
            [dataArray addObject:cellVM];
        }
    }
    [self.tableView.lc_dataArray addObjectsFromArray:dataArray];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == self.titleArray.count - 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.lc_Delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSArray<NSDictionary *> *)titleArray {
    if (!_titleArray) {
        _titleArray = @[
                        @{@"title" : @"我的左边间隔大"},
                        @{@"title" : @"我有箭头图片,还很高"},
                        @{@"title" : @"确定退出"},
                        ];
    }
    return _titleArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
