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
#import "YYKit.h"

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
/** 图片大小（默认为iconImage.size） */
@property (nonatomic, assign) CGSize iconSize;
@property (nonatomic, copy) void (^iconActionBlock)(void);

#pragma mark - 标题

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, copy) NSString *textStr;
@property (nonatomic, strong) NSMutableAttributedString *textAttrStr;
@property (nonatomic, assign) NSInteger textNumberOfLines;
@property (nonatomic, copy) void (^textActionBlock)(void);

#pragma mark - 详情

@property (nonatomic, strong) UIColor *detailTextColor;
@property (nonatomic, strong) UIFont *detailTextFont;
@property (nonatomic, assign) NSTextAlignment detailTextAlignment;
@property (nonatomic, copy) NSString *detailTextStr;
@property (nonatomic, strong) NSMutableAttributedString *detailTextAttrStr;
@property (nonatomic, assign) NSInteger detailTextNumberOfLines;
@property (nonatomic, copy) void (^detailTextActionBlock)(void);

#pragma mark - 右侧提示文字/图片,同时设置的话可以使用valueTextAttrStr

@property (nonatomic, strong) UIColor *valueTextColor;
@property (nonatomic, strong) UIFont *valueTextFont;
@property (nonatomic, copy) NSString *valueTextStr;
@property (nonatomic, strong) NSMutableAttributedString *valueTextAttrStr;

@property (nonatomic, strong) UIImage *valueImage;
/** 图片大小（默认为valueImage.size） */
@property (nonatomic, assign) CGSize valueSize;

@property (nonatomic, copy) void (^valueActionBlock)(void);

#pragma mark - 箭头图片/开关(默认显示箭头)

@property (nonatomic, assign) LCActionCellAccessoryType accessoryType;
@property (nonatomic, strong) UIImage *accessoryImage;
@property (nonatomic, assign) BOOL accessorySwitchOn;

@property (nonatomic, copy) void (^accessoryActionBlock)(void);

#pragma mark - 分割线(默认不显示)

@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) UIEdgeInsets topLineInsets;
@property (nonatomic, assign) UIEdgeInsets bottomLineInsets;
@property (nonatomic, assign) BOOL showTopLine;
@property (nonatomic, assign) BOOL showBottomLine;

#pragma mark - Cell布局

@property (nonatomic, strong) YYTextLayout *textLayout;
@property (nonatomic, strong) YYTextLayout *detailTextLayout;
@property (nonatomic, strong) YYTextLayout *valueTextLayout;

@property (nonatomic, assign) CGRect accessoryFrame;
@property (nonatomic, assign) CGRect valueFrame;
@property (nonatomic, assign) CGRect iconFrame;
@property (nonatomic, assign) CGRect textFrame;
@property (nonatomic, assign) CGRect detailFrame;
@property (nonatomic, assign) CGRect topLineFrame;
@property (nonatomic, assign) CGRect bottomLineFrame;

/** 写明这个ViewModel对应的cell类 */
+ (Class)cellClass;

/**
 固定高度：自适应布局(不调用的话cell中会调用)
 */
- (void)calculateLayout;

/**
 计算高度：所有设置完成后,调用
 */
- (void)calculateCellHeight;

@end
