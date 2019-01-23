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

- (instancetype)init {
    self = [super init];
    if (self) {
        // 默认设置
        _cellHeight = 44;
                
        _spaceHorizontal = 16;
        
        _iconAndTextSpaceH = 8;
        
        _textColor = [UIColor blackColor];
        _textFont = [UIFont systemFontOfSize:15];
        _textAlignment = NSTextAlignmentLeft;
        
        _textAndIndicatorSpaceH = 8;

        _lineColor = [UIColor lightGrayColor];
        _lineWidth = kLCLineWidth;
        _showTopLine = NO;
        _showBottomLine = NO;
    }
    return self;
}

@end
