//
//  LCCellsViewController.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/10.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCCellsViewController.h"
#import "UITableView+LCAdd.h"
#import "LCAnimalModel.h"
#import "EHIActionCell.h"

@interface LCCellsViewController ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LCCellsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"不同的cell显示";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configDatas];
}

- (void)configDatas {
    NSArray *titleArray = @[@"正常",
                            @"Xib",
                            @"MVVM"];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < titleArray.count; i++) {
        // MVVM
//        EHIActionCellViewModel *cellVM = [[EHIActionCellViewModel alloc] init];
//        cellVM.textStr = titleArray[i];
//        [dataArray addObject:cellVM];
        
        // Normal
        LCAnimalModel *model = [[LCAnimalModel alloc] init];
        [dataArray addObject:model];
    }
    [self.tableView.lc_dataArray addObjectsFromArray:dataArray];
}

#pragma mark - Method

//- (Class)tableView:(EHITableView *)tableView cellClassForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return [EHIActionCell class];
//}

//- (void)tableView:(EHITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath tableViewCell:(UITableViewCell *)tableViewCell viewModel:(id)viewModel {
//    tableViewCell.textLabel.numberOfLines = 0;
//    tableViewCell.textLabel.text = @"数据啊号地块为光伏而非接口都粉红色的就看见返回客户方科技阿萨";
//}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
//        tableView.delegate = self;
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
