//
//  LCAnimalCell.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/15.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCAnimalCell.h"

@implementation LCAnimalCell

#pragma mark - Setter

- (void)setViewModel:(LCAnimalCellViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.textLabel.text = viewModel.nameString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
