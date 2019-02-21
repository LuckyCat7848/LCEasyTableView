//
//  LCDataStyleRowsViewController.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/2/20.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCDataStyleRowsViewController.h"
#import "UITableView+LCAdd.h"
#import "LCActionCellViewModel.h"

@interface LCDataStyleRowsViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LCDataStyleRowsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"1-section,N-row";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configDatas];
}

- (void)configDatas {
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < 3; i++) {
        LCActionCellViewModel *cellVM = [[LCActionCellViewModel alloc] init];
        cellVM.textStr = [NSString stringWithFormat:@"section: %lu", (unsigned long)i];
        [dataArray addObject:cellVM];
    }
    [self.tableView.lc_dataArray addObjectsFromArray:dataArray];
}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
