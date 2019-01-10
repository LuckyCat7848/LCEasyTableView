//
//  EHIActionCellViewModel.m
//  1haiiPhone
//
//  Created by LuckyCat on 2018/7/31.
//  Copyright © 2018年 EHi. All rights reserved.
//

#import "EHIActionCellViewModel.h"

@implementation EHIActionCellViewModel

SetCellClass(EHIActionCell);

- (instancetype)init {
    self = [super init];
    if (self) {
        // 默认设置
//        _cellHeight = autoHeightOf6(37);
//        _textLeft = autoWidthOf6(16);
//
//        _textColor = HEXCOLOR_29B7B7;
//        _textFont = autoFONT(12);
//        _textAlignment = NSTextAlignmentLeft;
//
//        _indicatorImage = [UIImage imageNamed:@"OrderManage_More"];
//
//        _lineLeft = 0;
//        _lineColor = HEXCOLOR_e5e5e5;
        _showTopLine = NO;
        _showBottomLine = NO;
    }
    return self;
}

#pragma mark - Setter 赋值

- (void)setCellHeight:(CGFloat)cellHeight {
    _cellHeight = cellHeight;
    
    [self updateFrame];
}

- (void)setTextLeft:(CGFloat)textLeft {
    _textLeft = textLeft;
    
    [self updateFrame];
}

- (void)setShowTopLine:(BOOL)showTopLine {
    _showTopLine = showTopLine;
    
    [self updateFrame];
}

- (void)setShowBottomLine:(BOOL)showBottomLine {
    _showBottomLine = showBottomLine;
    
    [self updateFrame];
}

#pragma mark - 更新布局

- (void)updateFrame {
//    // 箭头图片
//    CGFloat indicatorWidth = autoWidthOf6(12) + autoWidthOf6(10);
//    self.indicatorFrame = CGRectMake(Main_Screen_Width - indicatorWidth, 0, indicatorWidth, self.cellHeight);
//    
//    // 文字
//    self.textFrame = CGRectMake(self.textLeft, 0, CGRectGetMinX(self.indicatorFrame) - self.textLeft - autoWidthOf6(8), self.cellHeight);
//    
//    // 分割线
//    if (self.showTopLine) {
//        self.topLineFrame = CGRectMake(self.lineLeft, 0, Main_Screen_Width - 2 * self.lineLeft, SINGLE_LINE_WIDTH);
//    }
//    if (self.showBottomLine) {
//        self.bottomLineFrame = CGRectMake(self.lineLeft, self.cellHeight - SINGLE_LINE_WIDTH, Main_Screen_Width - 2 * self.lineLeft, SINGLE_LINE_WIDTH);
//    }
}

@end
