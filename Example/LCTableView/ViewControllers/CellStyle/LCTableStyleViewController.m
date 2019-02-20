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

@property (nonatomic, copy) NSArray<NSArray *> *actionArray;

@end

@implementation LCTableStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"LCActionCell";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configDatas];
}

- (void)configDatas {
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < self.actionArray.count; i++) {
        NSArray *jArray = self.actionArray[i];
        NSMutableArray *tmpArray = [NSMutableArray array];

        for (NSUInteger j = 0; j < jArray.count; j++) {
            NSString *text = jArray[j];
            
            LCActionCellViewModel *cellVM = [[LCActionCellViewModel alloc] init];
            cellVM.textStr = text;
            if (i == 0) {
                if (j == 0) {
                    
                } else if (j == 1) {
                    cellVM.accessoryType = LCActionCellAccessoryTypeIndicator;
//                    cellVM.accessoryImage = [UIImage imageNamed:@"arrow_right"];
                } else if (j == 2) {
                    cellVM.accessoryType = LCActionCellAccessoryTypeIndicator;
//                    cellVM.accessoryImage = [UIImage imageNamed:@"arrow_right"];
                    cellVM.detailTextStr = @"detailTextStr";
                    cellVM.cellHeight = 60;
                } else if (j == 3) {
                    cellVM.accessoryType = LCActionCellAccessoryTypeIndicator;
//                    cellVM.accessoryImage = [UIImage imageNamed:@"arrow_right"];
                    cellVM.iconImage = [UIImage imageNamed:@"question_gray"];
                } else if (j == 4) {
                    cellVM.accessoryType = LCActionCellAccessoryTypeIndicator;
//                    cellVM.accessoryImage = [UIImage imageNamed:@"arrow_right"];
                    cellVM.iconImage = [UIImage imageNamed:@"question_gray"];
                    cellVM.detailTextStr = @"detailTextStr";
                    cellVM.cellHeight = 60;
                }
            } else if (i == 1) {
                cellVM.cellHeight = 60;
                cellVM.valueTextColor = [UIColor colorWithRed:0.87 green:0.31 blue:0.27 alpha:1.00];
                if (j == 0) {
                    cellVM.valueTextStr = @"valueTextStr";
                    cellVM.accessoryType = LCActionCellAccessoryTypeIndicator;
//                    cellVM.accessoryImage = [UIImage imageNamed:@"arrow_right"];
                    cellVM.valueTextEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 8);
                } else if (j == 1) {
                    cellVM.valueTextAttrStr = [[NSAttributedString alloc] initWithString:@"valueTextAttrStr" attributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.10 green:0.63 blue:0.37 alpha:1.00]}];
                    cellVM.detailTextStr = @"detailTextStr";
                } else if (j == 2) {
                    cellVM.valueImage = [UIImage imageNamed:@"question_gray"];
                    cellVM.accessoryType = LCActionCellAccessoryTypeIndicator;
//                    cellVM.accessoryImage = [UIImage imageNamed:@"arrow_right"];
                    cellVM.valueTextEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 8);
                } else if (j == 3) {
                    cellVM.valueImage = [UIImage imageNamed:@"question_gray"];
                    cellVM.detailTextStr = @"detailTextStr";
                } else if (j == 4) {
                    cellVM.accessoryType = LCActionCellAccessoryTypeSwitch;
                    cellVM.textStr = @"UISwitch类型";
                } else if (j == 5) {
                    cellVM.accessoryType = LCActionCellAccessoryTypeSwitch;
                    cellVM.textStr = @"UISwitch类型";
                    cellVM.detailTextStr = @"detailTextStr";
                    cellVM.accessorySwitchOn = YES;
                } else if (j == 6) {
                    cellVM.cellHeight = 44;
                    cellVM.textStr = @"确认提交";
                    cellVM.textColor = [UIColor colorWithRed:0.87 green:0.31 blue:0.27 alpha:1.00];
                    cellVM.textAlignment = NSTextAlignmentCenter;
                }
            } else if (i == 2) {
                cellVM.accessoryType = LCActionCellAccessoryTypeIndicator;
//                cellVM.accessoryImage = [UIImage imageNamed:@"arrow_right"];
                cellVM.cellHeight = 60;
                if (j == 0) {
                    cellVM.textEdgeInsets = UIEdgeInsetsMake(0, 40, 0, 0);
                    cellVM.detailTextStr = @"textEdgeInsets";
                } else if (j == 1) {
                    cellVM.iconImage = [UIImage imageNamed:@"question_gray"];
                    cellVM.iconEdgeInsets = UIEdgeInsetsMake(0, 50, 0, 0);
                    cellVM.detailTextStr = @"iconEdgeInsets";
                } else if (j == 2) {
                    cellVM.iconImage = [UIImage imageNamed:@"question_gray"];
                    cellVM.textEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
                    cellVM.detailTextStr = @"textEdgeInsets";
                } else if (j == 3) {
                    cellVM.iconImage = [UIImage imageNamed:@"question_gray"];
                    cellVM.detailTextEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
                    cellVM.detailTextStr = @"detailTextEdgeInsets";
                } else if (j == 4) {
                    cellVM.iconImage = [UIImage imageNamed:@"question_gray"];
                    cellVM.accessoryEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 50);
                    cellVM.detailTextStr = @"accessoryEdgeInsets,accessoryEdgeInsets,accessoryEdgeInsets,accessoryEdgeInsets,accessoryEdgeInsets";
                }
            } else if (i == 3) {
                cellVM.accessoryType = LCActionCellAccessoryTypeIndicator;
//                cellVM.accessoryImage = [UIImage imageNamed:@"arrow_right"];
                cellVM.cellHeight = 65 + j * 10;
                if (j == 0) {
                    cellVM.textNumberOfLines = 0;
                    cellVM.textStr = @"LCActionCellLCActionCellLCActionCellLCActionCell";
                } else if (j == 1) {
                    cellVM.textStr = @"LCActionCellLCActionCellLCActionCellLCActionCell";
                    cellVM.detailTextNumberOfLines = 0;
                    cellVM.detailTextStr = @"显示多行,显示多行,显示多行,显示多行,显示多行,显示多行,显示多行,显示多行";
                } else if (j == 2) {
                    cellVM.textNumberOfLines = 0;
                    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"LCActionCellLCActionCellLCActionCellLCActionCell"];
                    [attrStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"【attrStr】"
                                                                                    attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11],
                                                                                                 NSForegroundColorAttributeName : [UIColor redColor]}]];
                    cellVM.textAttrStr = attrStr;
                    
                    cellVM.detailTextNumberOfLines = 2;
                    NSMutableAttributedString *detailAttrStr = [[NSMutableAttributedString alloc] initWithString:@"显示多行,显示多行,显示多行,显示多行,显示多行,显示多行,显示多行,显示多行,显示多行"];
                    [detailAttrStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"（说明文字）"
                                                                                    attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11],
                                                                                                 NSForegroundColorAttributeName : [UIColor redColor]}]];
                    cellVM.detailTextAttrStr = detailAttrStr;
                }
            }
//            [cellVM calculateCellHeight];
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
    NSString *title = @"";
    if (section == 0) {
        title = @"普通 cell";
    } else if (section == 1) {
        title = @"特殊 cell";
    } else if (section == 2) {
        title = @"设置 insets";
    } else if (section == 3) {
        title = @"多行显示";
    }
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor colorWithRed:0.52 green:0.54 blue:0.59 alpha:1.00];
    label.text = [NSString stringWithFormat:@"  %@", title];
    return label;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewAutomaticDimension;
//}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.lc_Delegate = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSArray<NSArray *> *)actionArray {
    if (!_actionArray) {
        _actionArray = @[
                         @[
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             ],
                         
                         @[
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             ],
                         
                         @[
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             ],
                         
                         @[
                             @"LCActionCell",
                             @"LCActionCell",
                             @"LCActionCell",
                             ],
                         ];
    }
    return _actionArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
