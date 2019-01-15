//
//  LCTableViewIMP.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EHITableView.h"

@interface LCTableViewIMP : NSObject<UITableViewDelegate, UITableViewDataSource>

/** 数据类型 */
@property (nonatomic, assign) EHITableViewDataStyle dataStyle;

/**
 数据(如果EHITableViewDataStyleAll,为嵌套数组)
 */
@property (nonatomic, strong) NSArray *dataArray;

@end
