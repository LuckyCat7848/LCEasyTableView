//
//  LCViewController.m
//  LCTableView
//
//  Created by LuckyCat7848 on 01/09/2019.
//  Copyright (c) 2019 LuckyCat7848. All rights reserved.
//

#import "LCViewController.h"
#import "UITableView+LCAdd.h"
#import "LCActionCellViewModel.h"

#import "LCDataStyleRowsViewController.h"
#import "LCDataStyleSectionsViewController.h"
#import "LCDataStyleAllViewController.h"
#import "LCCellsViewController.h"
#import "LCTableStyleViewController.h"

@interface LCViewController ()<UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray<NSArray *> *titleArray;

@end

@implementation LCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"LCTableView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configDatas];
}

- (void)configDatas {
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < self.titleArray.count; i++) {
        NSArray *sections = self.titleArray[i];
        NSMutableArray *tmpArray = [NSMutableArray array];
        
        for (NSUInteger j = 0; j < sections.count; j++) {
            NSDictionary *dic = sections[j];
            LCActionCellViewModel *cellVM = [[LCActionCellViewModel alloc] init];
//            cellVM.cellHeight = 50;
            cellVM.textStr = dic[@"title"];
            [tmpArray addObject:cellVM];
        }
        [dataArray addObject:tmpArray];
    }
    [self.tableView.lc_dataArray addObjectsFromArray:dataArray];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor colorWithRed:0.52 green:0.54 blue:0.59 alpha:1.00];
    switch (section) {
        case 0:
            label.text = @" LCTableView";
            break;
        case 1:
            label.text = @" cell实现";
            break;
        case 2:
            label.text = @" cell封装";
            break;
        default:
            break;
    }
    return label;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dic = self.titleArray[indexPath.section][indexPath.row];
    Class class = NSClassFromString(dic[@"class"]);
    UIViewController *viewController = [[class alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.lc_Delegate = self;
        tableView.rowHeight = UITableViewAutomaticDimension;
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSArray<NSArray *> *)titleArray {
    if (!_titleArray) {
        _titleArray = @[
                        @[
                            @{@"title" : @"1-section,N-row",
                              @"class" : NSStringFromClass([LCDataStyleRowsViewController class])},
                            
                            @{@"title" : @"N-section,1-row",
                              @"class" : NSStringFromClass([LCDataStyleSectionsViewController class])},
                            
                            @{@"title" : @"N-section,N-row",
                              @"class" : NSStringFromClass([LCDataStyleAllViewController class])}
                            ],
                        
                        @[
                            @{@"title" : @"cell的不同实现方式",
                              @"class" : NSStringFromClass([LCCellsViewController class])}
                            ],
                        
                        @[
                            @{@"title" : @"LCActionCell",
                              @"class" : NSStringFromClass([LCTableStyleViewController class])}
                            ],
                        ];
    }
    return _titleArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
