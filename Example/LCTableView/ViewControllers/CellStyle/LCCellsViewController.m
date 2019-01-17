//
//  LCCellsViewController.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/10.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCCellsViewController.h"
#import "UITableView+LCAdd.h"
#import "LCPersonModel.h"
#import "LCAnimalCellViewModel.h"
#import "LCPlantModel.h"

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
                            @"MVVM",
                            @"Xib"];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < titleArray.count; i++) {
        if (i == 0) {
            // Normal
            LCPersonModel *model = [[LCPersonModel alloc] init];
            model.Name = titleArray[i];
            model.cellHeight = 80;
            [dataArray addObject:model];
        } else if (i == 1) {
            // MVVM
            LCAnimalModel *model = [[LCAnimalModel alloc] init];
            model.Name = titleArray[i];
            
            LCAnimalCellViewModel *cellVM = [[LCAnimalCellViewModel alloc] init];
            cellVM.model = model;
            [dataArray addObject:cellVM];
        } else {
            // Xib
            LCPlantModel *model = [[LCPlantModel alloc] init];
            model.Name = titleArray[i];
            model.cellHeight = 120;
            [dataArray addObject:model];
        }
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
