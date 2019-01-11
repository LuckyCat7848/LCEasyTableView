//
//  EHITableView.h
//  TestTableView
//
//  Created by LuckyCat on 2017/12/26.
//  Copyright © 2017年 LuckyCat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EHICellViewModelProtocol.h"
#import "MJRefresh.h"

/** 数据格式样式 */
typedef NS_ENUM(NSInteger, EHITableViewDataStyle) {
    EHITableViewDataStyleRows,    /// 默认:1个section,多个row
    EHITableViewDataStyleSections,/// 多个section,1个row
    EHITableViewDataStyleAll,    /// 多个section,多个row（数据为嵌套数组）
};

@class EHITableView;

@protocol  EHITableViewDelegate<NSObject, UIScrollViewDelegate>

@optional

/** header */
- (CGFloat)tableView:(EHITableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (UIView *)tableView:(EHITableView *)tableView viewForHeaderInSection:(NSInteger)section;

/** footer */
- (CGFloat)tableView:(EHITableView *)tableView heightForFooterInSection:(NSInteger)section;
- (UIView *)tableView:(EHITableView *)tableView viewForFooterInSection:(NSInteger)section;

/** cellClasslass */
- (Class)tableView:(EHITableView *)tableView cellClassForRowAtIndexPath:(NSIndexPath *)indexPath;

/** cell */
- (CGFloat)tableView:(EHITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(EHITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath tableViewCell:(UITableViewCell *)tableViewCell viewModel:(id)viewModel;
- (void)tableView:(EHITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath viewModel:(id)viewModel;

/** 滑动方向 */
- (void)tableView:(EHITableView *)tableView didScrollWithDirection:(BOOL)isUpDirection;

@end

@interface EHITableView : UIView

/** 数据类型 */
@property (nonatomic, assign) EHITableViewDataStyle dataStyle;
/** 代理 */
@property (nonatomic, weak) id<EHITableViewDelegate> delegate;

/** 刷新控件 */
@property (nonatomic, strong) MJRefreshNormalHeader *refreshHeader;
@property (nonatomic, strong) MJRefreshBackNormalFooter *refreshFooter;

/** 无数据时显示空视图 */
@property (nonatomic, strong) UIView *noDataView;

/**
 数据(如果EHITableViewDataStyleAll,为嵌套数组)
 */
@property (nonatomic, copy) NSArray *dataArray;

/** 用于处理减速 */
@property (nonatomic, assign) NSUInteger endDecelerateCount;

@end
