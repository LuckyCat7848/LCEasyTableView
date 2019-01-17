//
//  LCAnimalCellViewModel.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/15.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCAnimalCellViewModel.h"

@implementation LCAnimalCellViewModel

SetCellClass(LCAnimalCell)

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellHeight = 44;
    }
    return self;
}

- (void)setModel:(LCAnimalModel *)model {
    _model = model;
    
    self.nameString = model.Name;
}

@end
