//
//  LCPlantCell.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/15.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCPlantCell.h"

@implementation LCPlantCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Setter

- (void)setModel:(LCPlantModel *)model {
    _model = model;
    
    self.textLabel.text = model.Name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
