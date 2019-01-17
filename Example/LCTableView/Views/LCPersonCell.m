//
//  LCPersonCell.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/17.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCPersonCell.h"

@implementation LCPersonCell

- (void)setModel:(LCPersonModel *)model {
    _model = model;
    
    self.textLabel.text = model.Name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
