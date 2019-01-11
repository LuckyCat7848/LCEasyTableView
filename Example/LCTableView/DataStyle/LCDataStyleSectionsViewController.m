//
//  LCDataStyleSectionsViewController.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/10.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCDataStyleSectionsViewController.h"
#import "EHITableView.h"
#import "EHIActionCellViewModel.h"

@interface LCDataStyleSectionsViewController ()<EHITableViewDelegate>

@property (nonatomic, strong) EHITableView *tableView;

/** 刷新控件：头部 */
@property (nonatomic, strong) MJRefreshNormalHeader *refreshHeader;
/** 刷新控件：底部 */
@property (nonatomic, strong) MJRefreshBackNormalFooter *refreshFooter;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation LCDataStyleSectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"多个section,1个row";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.refreshHeader = self.refreshHeader;
    [self.refreshHeader beginRefreshing];
}

#pragma mark - Method

- (void)requestDataWithHeaderRefresh:(BOOL)isHeaderRefresh {
    sleep(2);
    
    if (isHeaderRefresh) {
        self.tableView.refreshFooter = self.refreshFooter; // 显示尾部
    }
    
    // 数据
    [self.dataArray addObjectsFromArray:[self getDatas]];
    self.tableView.dataArray = self.dataArray;
    
    // 结束刷新
    [self.refreshHeader endRefreshing];
    [self.refreshFooter endRefreshing];
    if (self.dataArray.count == 4) {
        [self.refreshFooter endRefreshingWithNoMoreData];
    }
}

/** 获取数据 */
- (NSArray *)getDatas {
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < 2; i++) {
        EHIActionCellViewModel *cellVM = [[EHIActionCellViewModel alloc] init];
        cellVM.textStr = [NSString stringWithFormat:@"actionCell %lu", (unsigned long)i];
        [dataArray addObject:cellVM];
    }
    return dataArray;
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
        tableView.dataStyle = EHITableViewDataStyleSections;
        tableView.delegate = self;
        
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        view.text = @"这是一个很随意的空页面";
        tableView.noDataView = view;
        
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (MJRefreshNormalHeader *)refreshHeader {
    if (!_refreshHeader) {
        kLCWeakify(self)
        MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            kLCStrongify(self)
            [self.dataArray removeAllObjects];
            self.tableView.dataArray = self.dataArray;
            
            self.tableView.refreshFooter = nil; // 下拉刷新的时候不显示尾部刷新
            [self requestDataWithHeaderRefresh:YES];
        }];
        refreshHeader.lastUpdatedTimeLabel.hidden = YES;
        
        _refreshHeader = refreshHeader;
    }
    return _refreshHeader;
}

- (MJRefreshBackNormalFooter *)refreshFooter {
    if (!_refreshFooter) {
        kLCWeakify(self)
        MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            kLCStrongify(self)
            [self requestDataWithHeaderRefresh:NO];
        }];
        _refreshFooter = refreshFooter;
    }
    return _refreshFooter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
