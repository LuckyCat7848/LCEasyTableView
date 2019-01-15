//
//  LCLabelCell.h
//  1haiiPhone
//
//  Created by LuckyCat on 2017/12/28.
//  Copyright © 2017年 EHi. All rights reserved.
//
//  cell样式：UILabel+UILabel
//

#import <UIKit/UIKit.h>
#import "LCLabelCellViewModel.h"

@interface LCLabelCell : UITableViewCell

/** 数据赋值 */
@property (nonatomic, strong) LCLabelCellViewModel *viewModel;

@end
