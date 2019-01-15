//
//  LCActionCellViewModel.h
//  1haiiPhone
//
//  Created by LuckyCat on 2018/7/31.
//  Copyright © 2018年 EHi. All rights reserved.
//
//  cell的ViewModel：UILabel+箭头
//

#import <Foundation/Foundation.h>
#import "LCCellDataProtocol.h"

@interface LCActionCellViewModel : NSObject<LCCellDataProtocol>

@property (nonatomic, assign) NSInteger identityType;
@property (nonatomic, strong) id model;
@property (nonatomic, assign) CGFloat cellHeight;

#pragma mark - 配置

/** 文字 */
@property (nonatomic, assign) CGFloat textLeft;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) NSTextAlignment textAlignment;

/** 箭头图片(默认显示) */
@property (nonatomic, strong) UIImage *indicatorImage;

/** 分割线(默认不显示) */
@property (nonatomic, assign) CGFloat lineLeft;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) BOOL showTopLine;
@property (nonatomic, assign) BOOL showBottomLine;

#pragma mark - 布局

/** 文字 */
@property (nonatomic, assign) CGRect textFrame;
@property (nonatomic, copy) NSString *textStr;

/** 箭头图片 */
@property (nonatomic, assign) CGRect indicatorFrame;

/** 分割线 */
@property (nonatomic, assign) CGRect topLineFrame;
@property (nonatomic, assign) CGRect bottomLineFrame;

/** 写明这个ViewModel对应的cell类 */
+ (Class)cellClass;
+ (LCCellDataType)cellDataType;

@end
