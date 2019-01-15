//
//  UITableView+LCAdd.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCTableViewDefines.h"

@interface UITableView (LCAdd)

/** 数据类型 */
@property (nonatomic, assign) LCTableViewDataStyle lc_dataStyle;

/** 使用者额外想实现代理方法（UIViewController/UIView...） */
@property (nonatomic, weak) id<UITableViewDelegate, UITableViewDataSource> lc_Delegate;

/**
    数据(如果数据类型为LCTableViewDataStyleAll,为嵌套数组)
 */
@property (nonatomic, strong, readonly) NSMutableArray *lc_dataArray;

@end
