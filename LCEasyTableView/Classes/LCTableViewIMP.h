//
//  LCTableViewIMP.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//
//  默认实现TableView的代理方法
//

#import <Foundation/Foundation.h>
#import "LCCellDataProtocol.h"

@interface LCTableViewIMP : NSObject<UITableViewDelegate, UITableViewDataSource>

/** 单层数组,多个section，1个row类型 */
@property (nonatomic, assign) BOOL isSectionsStyle;

/**
    数据
 */
@property (nonatomic, strong) NSArray *dataArray;

@end
