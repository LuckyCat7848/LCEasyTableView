//
//  LCTextFieldCellViewModel.h
//  1haiiPhone
//
//  Created by LuckyCat on 2017/12/25.
//  Copyright © 2017年 EHi. All rights reserved.
//
//  cell的ViewModel：UILabel+UITextField
//

#import <Foundation/Foundation.h>
#import "LCCellDataProtocol.h"

/** cell使用到的数据 */
@interface LCTextFieldCellModel : NSObject

@property (nonatomic, copy) NSString *tipString;
@property (nonatomic, copy) NSString *contentString;
@property (nonatomic, copy) NSString *contentPlaceholderString;

@end

@interface LCTextFieldCellViewModel : NSObject<LCCellDataProtocol>

@property (nonatomic, strong) LCTextFieldCellModel *model;
@property (nonatomic, assign) CGFloat cellHeight;

/** 统一对齐提示语的宽度 */
@property (nonatomic, assign) CGFloat tipWidth;

/** 是否可编辑,默认为YES */
@property (nonatomic, assign) BOOL editEnable;

/** 输入键盘类型 */
@property (nonatomic, assign) UIKeyboardType contentKeyboardType;

/** 输入文字开始 */
@property (nonatomic, copy) void (^intputBeginBlock)(UITextField *textField);

/** 输入文字结束 */
@property (nonatomic, copy) void (^intputEndBlock)(UITextField *textField);

/**
 输入文字检查：是否可以改变(输入)
 textField : 当前输入框
 changeRange : 改变的范围
 replacementString : 替换的string
 */
@property (nonatomic, copy) BOOL (^intputShouldChangeBlock)(UITextField *textField, NSRange changeRange, NSString *replacementString);

/** 输入文字变化 */
@property (nonatomic, copy) void (^intputChangedBlock)(UITextField *textField, NSString *newString);

/** 提示label */
@property (nonatomic, strong) UIColor *tipTextColor;
@property (nonatomic, strong) UIFont *tipTextFont;
@property (nonatomic, assign) NSTextAlignment tipTextAlignment;
@property (nonatomic, assign) CGRect tipFrame;
@property (nonatomic, copy) NSString *tipStr;

/** 输入框 */
@property (nonatomic, strong) UIColor *contentTextColor;
@property (nonatomic, strong) UIColor *contentPlaceholderColor;
@property (nonatomic, strong) UIFont *contentTextFont;
@property (nonatomic, assign) CGRect contentFrame;
@property (nonatomic, copy) NSString *contentStr;
@property (nonatomic, copy) NSString *contentPlaceholderStr;


/** 写明这个ViewModel对应的cell类 */
+ (Class)cellClass;

@end
