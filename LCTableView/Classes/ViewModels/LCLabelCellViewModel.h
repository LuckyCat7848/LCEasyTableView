//
//  LCLabelCellViewModel.h
//  1haiiPhone
//
//  Created by LuckyCat on 2017/12/28.
//  Copyright © 2017年 EHi. All rights reserved.
//
//  cell的ViewModel：UILabel+UILabel
//

#import <Foundation/Foundation.h>
#import "LCCellDataProtocol.h"

@interface LCLabelCellViewModel : NSObject<LCCellDataProtocol>

@property (nonatomic, strong) id model;
@property (nonatomic, assign) CGFloat cellHeight;

/** 提示语左边的宽度 */
@property (nonatomic, assign) CGFloat tipLeft;

/** 提示label */
@property (nonatomic, strong) UIColor *tipTextColor;
@property (nonatomic, strong) UIFont *tipTextFont;
@property (nonatomic, assign) NSTextAlignment tipTextAlignment;
@property (nonatomic, assign) CGRect tipFrame;
@property (nonatomic, copy) NSString *tipStr;

/** 内容label */
@property (nonatomic, strong) UIColor *contentTextColor;
@property (nonatomic, strong) UIFont *contentTextFont;
@property (nonatomic, assign) NSTextAlignment contentTextAlignment;
@property (nonatomic, assign) CGRect contentFrame;
@property (nonatomic, copy) NSString *contentStr;


/** 写明这个ViewModel对应的cell类 */
+ (Class)cellClass;

@end
