//
//  EHITextFieldCellViewModel.m
//  1haiiPhone
//
//  Created by LuckyCat on 2017/12/25.
//  Copyright © 2017年 EHi. All rights reserved.
//

#import "EHITextFieldCellViewModel.h"

@implementation EHITextFieldCellModel

@end

@implementation EHITextFieldCellViewModel

SetCellClass(EHITextFieldCell);

- (instancetype)init {
    self = [super init];
    if (self) {
        // 默认设置
        _cellHeight = 44;
        _tipWidth = 60;
        _editEnable = YES;
        _contentKeyboardType = UIKeyboardTypeDefault;
        
//        _tipTextColor = HEXCOLOR_333333;
//        _tipTextFont = autoFONT(13);
//        _tipTextAlignment = NSTextAlignmentRight;
//
//        _contentTextColor = HEXCOLOR_666666;
//        _contentPlaceholderColor = HEXCOLOR_a0a0a0;
//        _contentTextFont = autoFONT(13);
    }
    return self;
}

#pragma mark - Setter 赋值

- (void)setTipWidth:(CGFloat)tipWidth {
    _tipWidth = tipWidth;
    
//    self.tipFrame = CGRectMake(autoWidthOf6(22), 0, tipWidth, self.cellHeight);
//    CGFloat contentPointX = CGRectGetMaxX(self.tipFrame) - 3;
//    self.contentFrame = CGRectMake(contentPointX, 0, Main_Screen_Width - contentPointX - CGRectGetMinX(self.tipFrame), self.cellHeight);
}

- (void)setModel:(EHITextFieldCellModel *)model {
    _model = model;
    
    self.tipStr = model.tipString;
    self.contentStr = model.contentString;
    self.contentPlaceholderStr = model.contentPlaceholderString;
}

@end
