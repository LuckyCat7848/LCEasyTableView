//
//  EHILabelCellViewModel.m
//  1haiiPhone
//
//  Created by LuckyCat on 2017/12/28.
//  Copyright © 2017年 EHi. All rights reserved.
//

#import "EHILabelCellViewModel.h"

@implementation EHILabelCellViewModel

SetCellClass(EHILabelCell);

- (instancetype)init {
    self = [super init];
    if (self) {
        // 默认设置
        _cellHeight = 44;
        _tipLeft = 122;
        
//        _tipTextColor = HEXCOLOR_666666;
//        _tipTextFont = autoFONT(13);
//        _tipTextAlignment = NSTextAlignmentLeft;
//
//        _contentTextColor = HEXCOLOR_999999;
//        _contentTextFont = autoFONT(11);
//        _contentTextAlignment = NSTextAlignmentLeft;
    }
    return self;
}

#pragma mark - Setter 赋值

- (void)setTipLeft:(CGFloat)tipLeft {
    _tipLeft = tipLeft;
    
//    self.tipFrame = CGRectMake(tipLeft, 15, Main_Screen_Width - tipLeft, autoHeightOf6(15));
//    self.contentFrame = CGRectMake(tipLeft, CGRectGetMaxY(self.tipFrame) + 5, Main_Screen_Width - tipLeft, autoHeightOf6(13));
    self.cellHeight = CGRectGetMaxY(self.contentFrame);
}

- (void)setModel:(id)model {
//    model = model;
}

//- (void)setModel:(EHIVATInvoiceCompanyModel *)model {
//    _model = model;
//    
//    self.tipStr = model.Title;
//    self.contentStr = model.TaxPayerId;
//}

@end
