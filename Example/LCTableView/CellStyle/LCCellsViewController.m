//
//  LCCellsViewController.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/10.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCCellsViewController.h"
#import "UITableView+LCAdd.h"
#import "LCAnimalCellViewModel.h"

@interface LCCellsViewController ()<UITableViewDelegate, UITableViewDataSource>

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
                            @"MVVM"];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < titleArray.count; i++) {
        LCAnimalModel *model = [[LCAnimalModel alloc] init];
        model.Name = titleArray[i];
        if (i == 0) {
            // Normal
            model.cellHeight = 80;
            [dataArray addObject:model];
        } else {
            // MVVM
            LCAnimalCellViewModel *cellVM = [[LCAnimalCellViewModel alloc] init];
            cellVM.model = model;
            [dataArray addObject:cellVM];
        }
    }
    [self.tableView.lc_dataArray addObjectsFromArray:dataArray];
}

#pragma mark - Method

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *identifier = @"cellPool";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    cell.textLabel.numberOfLines = 0;
//    cell.textLabel.text = @"任务与风格就很反感和坚实的妇科鱼鼓风机股份金黄色的吃我回家法国红酒sad给大家哈师大的股份搜房网井神股份几乎都是功夫科维奇";
//    return cell;
//}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.lc_Delegate = self;
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
