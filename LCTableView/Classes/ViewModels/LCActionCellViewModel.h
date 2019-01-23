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

@property (nonatomic, strong) id model;
@property (nonatomic, assign) CGFloat cellHeight;

#pragma mark - 配置

/** 左右两边边距 */
@property (nonatomic, assign) CGFloat spaceHorizontal;

/** 图片icon */
@property (nonatomic, strong) UIImage *iconImage;
/** 图片大小（默认为iconImage.size） */
@property (nonatomic, assign) CGSize iconSize;
/** icon和文字水平间距（默认8） */
@property (nonatomic, assign) CGFloat iconAndTextSpaceH;

/** 文字 */
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, copy) NSString *textStr;
@property (nonatomic, copy) NSAttributedString *textAttrStr;

/** 箭头图片(默认不显示) */
@property (nonatomic, strong) UIImage *indicatorImage;
/** 文字和箭头水平间距（默认8） */
@property (nonatomic, assign) CGFloat textAndIndicatorSpaceH;

/** 分割线(默认不显示) */
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) UIEdgeInsets topLineInsets;
@property (nonatomic, assign) UIEdgeInsets bottomLineInsets;
@property (nonatomic, assign) BOOL showTopLine;
@property (nonatomic, assign) BOOL showBottomLine;

/** 写明这个ViewModel对应的cell类 */
+ (Class)cellClass;

@end
