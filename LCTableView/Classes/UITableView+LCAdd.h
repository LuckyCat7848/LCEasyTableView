//
//  UITableView+LCAdd.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EHITableView.h"

@interface UITableView (LCAdd)

/** 数据类型 */
@property (nonatomic, assign) EHITableViewDataStyle lc_dataStyle;

/**
 数据(如果数据类型为EHITableViewDataStyleAll,为嵌套数组)
 */
@property (nonatomic, strong, readonly) NSMutableArray *lc_dataArray;


- (void)lc_addDelegate:(id<UITableViewDelegate>)delegate;
- (void)lc_addDataSource:(id<UITableViewDataSource>)dataSource;

@end
