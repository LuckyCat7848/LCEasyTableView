//
//  LCLabelCell.m
//  1haiiPhone
//
//  Created by LuckyCat on 2017/12/28.
//  Copyright © 2017年 EHi. All rights reserved.
//

#import "LCLabelCell.h"

@interface LCLabelCell ()

/** 提示文字 */
@property (nonatomic, strong) UILabel *tipLabel;

/** 内容文字 */
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation LCLabelCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - 赋值

- (void)setViewModel:(LCLabelCellViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.tipLabel.textColor = viewModel.tipTextColor;
    self.tipLabel.font = viewModel.tipTextFont;
    self.tipLabel.textAlignment = viewModel.tipTextAlignment;
    self.tipLabel.frame = viewModel.tipFrame;
    self.tipLabel.text = viewModel.tipStr;
    
    self.contentLabel.textColor = viewModel.contentTextColor;
    self.contentLabel.font = viewModel.contentTextFont;
    self.contentLabel.textAlignment = viewModel.contentTextAlignment;
    self.contentLabel.frame = viewModel.contentFrame;
    self.contentLabel.text = viewModel.contentStr;
}

#pragma mark - Getter

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:_tipLabel];
    }
    return _tipLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:_contentLabel];
    }
    return _contentLabel;
}

@end
