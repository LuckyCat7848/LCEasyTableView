//
//  LCTextFieldCell.m
//  1haiiPhone
//
//  Created by LuckyCat on 2017/12/26.
//  Copyright © 2017年 EHi. All rights reserved.
//

#import "LCTextFieldCell.h"

@interface LCTextFieldCell ()<UITextFieldDelegate>

/** 提示文字 */
@property (nonatomic, strong) UILabel *tipLabel;

/** 输入文字 */
@property (nonatomic, strong) UITextField *contentTextField;

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

@end

@implementation LCTextFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    [self.contentTextField resignFirstResponder];
}

#pragma mark - 赋值

- (void)setViewModel:(LCTextFieldCellViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.intputBeginBlock = viewModel.intputBeginBlock;
    self.intputEndBlock = viewModel.intputEndBlock;
    self.intputShouldChangeBlock = viewModel.intputShouldChangeBlock;
    self.intputChangedBlock = viewModel.intputChangedBlock;

    self.tipLabel.textColor = viewModel.tipTextColor;
    self.tipLabel.font = viewModel.tipTextFont;
    self.tipLabel.textAlignment = viewModel.tipTextAlignment;
    self.tipLabel.frame = viewModel.tipFrame;
    self.tipLabel.text = viewModel.tipStr;
    
    self.contentTextField.textColor = viewModel.contentTextColor;
    [self.contentTextField setValue:viewModel.contentPlaceholderColor forKeyPath:@"_placeholderLabel.textColor"];
    self.contentTextField.font = viewModel.contentTextFont;
    self.contentTextField.frame = viewModel.contentFrame;
    self.contentTextField.text = viewModel.contentStr;
    self.contentTextField.placeholder = viewModel.contentPlaceholderStr;
    self.contentTextField.keyboardType = viewModel.contentKeyboardType;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return self.viewModel.editEnable;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.contentTextField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.intputBeginBlock) {
        self.intputBeginBlock(textField);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.intputEndBlock) {
        self.intputEndBlock(textField);
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    if ([textField keyboardHighlight]) {
//        return YES;
//    }
    if (self.intputShouldChangeBlock) {
        return self.intputShouldChangeBlock(textField, range, string);
    }
    return YES;
}

- (void)textFieldEditingChanged:(UITextField *)textField {
//    if ([textField keyboardHighlight]) {
//        return ;
//    }
    if (self.intputChangedBlock) {
        self.intputChangedBlock(textField, textField.text);
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (self.intputChangedBlock) {
        self.intputChangedBlock(textField, nil);
    }
    return YES;
}

#pragma mark - Getter

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        [self addSubview:_tipLabel];
    }
    return _tipLabel;
}

- (UITextField *)contentTextField {
    if (!_contentTextField) {
        UITextField *textField = [[UITextField alloc] init];
        textField.returnKeyType = UIReturnKeyDone;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.delegate = self;
        [textField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
        
        [self addSubview:textField];
        _contentTextField = textField;
    }
    return _contentTextField;
}

@end
