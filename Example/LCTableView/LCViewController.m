//
//  LCViewController.m
//  LCTableView
//
//  Created by LuckyCat7848 on 01/09/2019.
//  Copyright (c) 2019 LuckyCat7848. All rights reserved.
//

#import "LCViewController.h"
#import "UITableView+LCAdd.h"
#import "EHITableView.h"
#import "EHIActionCellViewModel.h"

#import "LCDataStyleSectionsViewController.h"
#import "LCDataStyleAllViewController.h"
#import "LCCellsViewController.h"

@interface LCViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray<NSDictionary *> *titleArray;

@end

@implementation LCViewController

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
        
        EHIActionCellViewModel *cellVM = [[EHIActionCellViewModel alloc] init];
        cellVM.textStr = dic[@"title"];
        [dataArray addObject:cellVM];
    }
    [self.tableView.lc_dataArray addObjectsFromArray:dataArray];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.titleArray[indexPath.row];
    
    Class class = NSClassFromString(dic[@"class"]);
    UIViewController *viewController = [[class alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

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

- (NSArray<NSDictionary *> *)titleArray {
    if (!_titleArray) {
        _titleArray = @[
                        @{@"title" : @"多个section,1个row（空页面+下拉刷新/上拉加载）",
                          @"class" : NSStringFromClass([LCDataStyleSectionsViewController class])},
                        
                        @{@"title" : @"多个section,多个row",
                          @"class" : NSStringFromClass([LCDataStyleAllViewController class])},
                        
                        @{@"title" : @"不同的cell显示",
                          @"class" : NSStringFromClass([LCCellsViewController class])},
                        ];
    }
    return _titleArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
