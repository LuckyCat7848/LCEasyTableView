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

/** 右侧箭头显示类型 */
typedef NS_ENUM(NSInteger, LCActionCellAccessoryType) {
    /** 无 */
    LCActionCellAccessoryTypeNone,
    /** 箭头或其他图片 */
    LCActionCellAccessoryTypeIndicator,
    /** 开关 */
    LCActionCellAccessoryTypeSwitch,
};

@interface LCActionCellViewModel : NSObject<LCCellDataProtocol>

@property (nonatomic, strong) id model;
@property (nonatomic, assign) CGFloat cellHeight;

#pragma mark - 间距

@property(nonatomic, assign) UIEdgeInsets iconEdgeInsets;
@property(nonatomic, assign) UIEdgeInsets textEdgeInsets;
@property(nonatomic, assign) UIEdgeInsets detailTextEdgeInsets;
@property(nonatomic, assign) UIEdgeInsets valueTextEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets accessoryEdgeInsets;

#pragma mark - 图片

@property (nonatomic, strong) UIImage *iconImage;
/** icon图片大小（默认为iconImage.size） */
@property (nonatomic, assign) CGSize iconSize;

#pragma mark - 标题

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, copy) NSString *textStr;
@property (nonatomic, copy) NSAttributedString *textAttrStr;
@property (nonatomic, assign) NSInteger textNumberOfLines;

#pragma mark - 详情

@property (nonatomic, strong) UIColor *detailTextColor;
@property (nonatomic, strong) UIFont *detailTextFont;
@property (nonatomic, assign) NSTextAlignment detailTextAlignment;
@property (nonatomic, copy) NSString *detailTextStr;
@property (nonatomic, copy) NSAttributedString *detailTextAttrStr;
@property (nonatomic, assign) NSInteger detailTextNumberOfLines;

#pragma mark - 右侧提示文字/图片

@property (nonatomic, strong) UIColor *valueTextColor;
@property (nonatomic, strong) UIFont *valueTextFont;
@property (nonatomic, copy) NSString *valueTextStr;
@property (nonatomic, copy) NSAttributedString *valueTextAttrStr;

@property (nonatomic, strong) UIImage *valueImage;
/** 提示图片大小（默认为valueImage.size） */
@property (nonatomic, assign) CGSize valueSize;

#pragma mark - 箭头图片/开关(默认不显示)

@property (nonatomic, assign) LCActionCellAccessoryType accessoryType;
@property (nonatomic, strong) UIImage *accessoryImage;
@property (nonatomic, assign) BOOL accessorySwitchOn;

#pragma mark - 分割线(默认不显示)

@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) UIEdgeInsets topLineInsets;
@property (nonatomic, assign) UIEdgeInsets bottomLineInsets;
@property (nonatomic, assign) BOOL showTopLine;
@property (nonatomic, assign) BOOL showBottomLine;

/** 写明这个ViewModel对应的cell类 */
+ (Class)cellClass;

@end
