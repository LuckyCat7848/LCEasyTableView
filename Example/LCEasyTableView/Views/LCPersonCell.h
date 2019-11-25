//
//  LCPersonCell.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/17.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCPersonModel.h"

@interface LCPersonCell : UITableViewCell

/** 数据 */
@property (nonatomic, strong) LCPersonModel *model;

@end
