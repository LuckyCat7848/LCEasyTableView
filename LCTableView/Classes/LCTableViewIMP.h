//
//  LCTableViewIMP.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCTableViewProxy.h"
#import "EHITableView.h"

@interface LCTableViewIMP : NSObject<UITableViewDataSource, UITableViewDelegate>

/** 数据类型 */
@property (nonatomic, assign) EHITableViewDataStyle dataStyle;

/**
 数据(如果EHITableViewDataStyleAll,为嵌套数组)
 */
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) LCTableViewProxy *proxy;

@end
