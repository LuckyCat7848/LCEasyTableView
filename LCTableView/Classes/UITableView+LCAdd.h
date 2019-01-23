//
//  UITableView+LCAdd.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//
//  TableView的扩展
//

#import <UIKit/UIKit.h>
#import "LCDefines.h"

@interface UITableView (LCAdd)

/** 使用者额外想实现代理方法（UIViewController/UIView...） */
@property (nonatomic, weak) id<UITableViewDelegate, UITableViewDataSource> lc_Delegate;

/**
    数据
    默认：1-section，N-row
    嵌套数组：N-section，N-row
    特殊：N-section，1-row（置lc_isSectionsStyle为True）
 */
@property (nonatomic, strong, readonly) NSMutableArray *lc_dataArray;

@property (nonatomic, assign) BOOL lc_isSectionsStyle;

@end
