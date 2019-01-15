//
//  LCAnimalCell.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/15.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCAnimalCellViewModel.h"

@interface LCAnimalCell : UITableViewCell

/** 数据 */
@property (nonatomic, strong) LCAnimalModel *model;

/** 数据：VM */
@property (nonatomic, strong) LCAnimalCellViewModel *viewModel;

@end
