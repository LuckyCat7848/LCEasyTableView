//
//  LCTextFieldCell.h
//  1haiiPhone
//
//  Created by LuckyCat on 2017/12/26.
//  Copyright © 2017年 EHi. All rights reserved.
//
//  cell样式：UILabel+UITextField
//

#import <UIKit/UIKit.h>
#import "LCTextFieldCellViewModel.h"

@interface LCTextFieldCell : UITableViewCell

/** 数据赋值 */
@property (nonatomic, strong) LCTextFieldCellViewModel *viewModel;

@end
