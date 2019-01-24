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
        
        // 间距
        _iconEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
        _textEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
        _detailTextEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
        _valueTextEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 16);
        _accessoryEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 16);
        
        // 标题
        _textColor = [UIColor blackColor];
        _textFont = [UIFont systemFontOfSize:15];
        _textAlignment = NSTextAlignmentLeft;
        _textNumberOfLines = 1;
        
        // 详情
        _detailTextColor = [UIColor lightGrayColor];
        _detailTextFont = [UIFont systemFontOfSize:12];
        _detailTextAlignment = NSTextAlignmentLeft;
        _detailTextNumberOfLines = 1;

        // 右侧提示文字/图片
        _valueTextColor = [UIColor lightGrayColor];
        _valueTextFont = [UIFont systemFontOfSize:12];
        
        // 箭头图片/开关
        _accessoryImage = [UIImage imageNamed:@"arrow_right"];
        
        // 分割线
        _lineColor = [UIColor lightGrayColor];
        _lineWidth = kLCLineWidth;
        _showTopLine = NO;
        _showBottomLine = NO;
    }
    return self;
}

@end
