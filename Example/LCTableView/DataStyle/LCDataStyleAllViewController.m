//
//  LCDataStyleAllViewController.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/10.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCDataStyleAllViewController.h"
#import "EHITableView.h"
#import "EHIActionCellViewModel.h"

@interface LCDataStyleAllViewController ()<EHITableViewDelegate>

@property (nonatomic, strong) EHITableView *tableView;

@end

@implementation LCDataStyleAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"多个section,多个row";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configDatas];
}

- (void)configDatas {
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < 3; i++) {
        NSMutableArray *array = [NSMutableArray array];
        for (NSUInteger j = 0; j < 2; j++) {
            EHIActionCellViewModel *cellVM = [[EHIActionCellViewModel alloc] init];
            cellVM.textStr = [NSString stringWithFormat:@"actionCell %lu,%lu", (unsigned long)i, (unsigned long)j];
            [array addObject:cellVM];
        }
        [dataArray addObject:array];
    }
    self.tableView.dataArray = dataArray;
}

#pragma mark - EHITableViewDelegate

- (CGFloat)tableView:(EHITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (UIView *)tableView:(EHITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor yellowColor];
    label.text = [NSString stringWithFormat:@"section %ld", (long)section];
    return label;
}

#pragma mark - Getter

- (EHITableView *)tableView {
    if (!_tableView) {
        EHITableView *tableView = [[EHITableView alloc] initWithFrame:self.view.bounds];
        tableView.dataStyle = EHITableViewDataStyleAll;
        tableView.delegate = self;
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
