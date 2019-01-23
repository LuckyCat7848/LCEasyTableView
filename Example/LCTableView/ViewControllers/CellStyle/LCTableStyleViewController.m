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

@property (nonatomic, copy) NSArray<NSDictionary *> *actionArray;

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
    for (NSUInteger i = 0; i < self.actionArray.count; i++) {
        NSDictionary *dic = self.actionArray[i];
        
        LCActionCellViewModel *cellVM = [[LCActionCellViewModel alloc] init];
        cellVM.showBottomLine = YES;
        if (i == 0) {
            
        } else if (i == 1) {
            cellVM.bottomLineInsets = UIEdgeInsetsMake(0, 16, 0, 16);
            cellVM.spaceHorizontal = 50;
            
        } else if (i == 2) {
            cellVM.indicatorImage = [UIImage imageNamed:@"arrow_right"];
            cellVM.bottomLineInsets = UIEdgeInsetsMake(0, 16, 15, 0);
            cellVM.cellHeight = 80;
            NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:dic[@"title"]];
            [attrStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"（说明文字啦啦）"
                                                                            attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11],
                                                                                         NSForegroundColorAttributeName : [UIColor redColor]}]];
             cellVM.textAttrStr = attrStr;
        
        } else if (i == 3) {
            cellVM.iconImage = [UIImage imageNamed:@"question_gray"];
        
        } else if (i == 4) {
            cellVM.textColor = [UIColor redColor];
            cellVM.textAlignment = NSTextAlignmentCenter;
        }
        cellVM.textStr = dic[@"title"];
        [dataArray addObject:cellVM];
    }
    [self.tableView.lc_dataArray addObjectsFromArray:dataArray];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == self.actionArray.count - 1) {
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

- (NSArray<NSDictionary *> *)actionArray {
    if (!_actionArray) {
        _actionArray = @[
                        @{@"title" : @"正常的,默认的"},
                        @{@"title" : @"我的左右边间隔大，底线左右间隔大"},
                        @{@"title" : @"我有箭头图片,底线布局特殊,还很高,使用attrStr 哈哈哈哈哈哈哈~~~~嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻你还喜欢吗"},
                        @{@"title" : @"我有左icon图片"},
                        @{@"title" : @"确定退出"},
                        ];
    }
    return _actionArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
