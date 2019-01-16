//
//  LCActionCellViewModel.m
//  1haiiPhone
//
//  Created by LuckyCat on 2018/7/31.
//  Copyright © 2018年 EHi. All rights reserved.
//

#import "LCActionCellViewModel.h"
#import "LCDefines.h"

@implementation LCActionCellViewModel

SetCellClass(LCActionCell);
SetCellDataType(LCCellDataTypeViewModel)

- (instancetype)init {
    self = [super init];
    if (self) {
        // 默认设置
        _cellHeight = 44;

        _textLeft = 16;
        _textColor = [UIColor blackColor];
        _textFont = [UIFont systemFontOfSize:12];
        _textAlignment = NSTextAlignmentLeft;

        _lineColor = [UIColor lightGrayColor];
        _showTopLine = NO;
        _showBottomLine = NO;
    }
    return self;
}

@end
