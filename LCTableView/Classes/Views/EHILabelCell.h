//
//  EHILabelCell.h
//  1haiiPhone
//
//  Created by LuckyCat on 2017/12/28.
//  Copyright © 2017年 EHi. All rights reserved.
//
//  cell样式：UILabel+UILabel
//

#import <UIKit/UIKit.h>
#import "EHILabelCellViewModel.h"

@interface EHILabelCell : UITableViewCell

/** 数据赋值 */
@property (nonatomic, strong) EHILabelCellViewModel *viewModel;

@end
