//
//  LCActionCell.m
//  1haiiPhone
//
//  Created by LuckyCat on 2018/7/31.
//  Copyright © 2018年 EHi. All rights reserved.
//

#import "LCActionCell.h"
#import "UIView+LCAdd.h"
#import "LCDefines.h"

@interface LCActionCell ()

/** icon */
@property (nonatomic, strong) UIImageView *iconImageView;
/** 文字 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 详情 */
@property (nonatomic, strong) UILabel *subtitleLabel;

/** 右侧提示文字/图片 */
 @property (nonatomic, strong) UIButton *valueTextButton;
/** 右侧箭头/开关 */
@property (nonatomic, strong) UIView *actionView;

/** 顶部分割线 */
@property (nonatomic, strong) UIView *topLineView;
/** 底部分割线 */
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation LCActionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - 赋值

- (void)setViewModel:(LCActionCellViewModel *)viewModel {
    _viewModel = viewModel;
    
    // icon
    _iconImageView.hidden = YES;
    if (viewModel.iconImage) {
        self.iconImageView.hidden = NO;
        self.iconImageView.image = viewModel.iconImage;
    }
    
    // 标题
    self.titleLabel.numberOfLines = viewModel.textNumberOfLines;
    self.titleLabel.textColor = viewModel.textColor;
    self.titleLabel.font = viewModel.textFont;
    if (viewModel.textAttrStr) {
        self.titleLabel.text = nil;
        self.titleLabel.attributedText = viewModel.textAttrStr;
    } else {
        self.titleLabel.attributedText = nil;
        self.titleLabel.text = viewModel.textStr;
    }
    self.titleLabel.textAlignment = viewModel.textAlignment;
    
    // 详情
    _subtitleLabel.hidden = YES;
    if (viewModel.detailTextStr || viewModel.detailTextAttrStr) {
        self.subtitleLabel.hidden = NO;
        self.subtitleLabel.numberOfLines = viewModel.detailTextNumberOfLines;
        self.subtitleLabel.textColor = viewModel.detailTextColor;
        self.subtitleLabel.font = viewModel.detailTextFont;
        if (viewModel.detailTextAttrStr) {
            self.subtitleLabel.text = nil;
            self.subtitleLabel.attributedText = viewModel.detailTextAttrStr;
        } else {
            self.subtitleLabel.attributedText = nil;
            self.subtitleLabel.text = viewModel.detailTextStr;
        }
        self.subtitleLabel.textAlignment = viewModel.detailTextAlignment;
    }

    // 右侧提示文字/图片
    _valueTextButton.hidden = YES;
    if (viewModel.valueImage || viewModel.valueTextStr.length || viewModel.valueTextAttrStr.length) {
        self.valueTextButton.hidden = NO;
        [self.valueTextButton setTitleColor:viewModel.valueTextColor forState:UIControlStateNormal];
        self.valueTextButton.titleLabel.font = viewModel.valueTextFont;
        
        if (viewModel.valueImage) {
            [self.valueTextButton setImage:viewModel.valueImage forState:UIControlStateNormal];
        } else if (viewModel.valueTextAttrStr) {
            [self.valueTextButton setAttributedTitle:viewModel.valueTextAttrStr forState:UIControlStateNormal];
        } else {
            [self.valueTextButton setTitle:viewModel.valueTextStr forState:UIControlStateNormal];
        }
        self.valueTextButton.titleLabel.textAlignment = NSTextAlignmentRight;
    }
    
    // 箭头
    _actionView.hidden = NO;
    if (viewModel.accessoryType == LCActionCellAccessoryTypeSwitch) {
        // 开关
        UISwitch *aSwitch = (UISwitch *)self.actionView;
        if (!aSwitch || ![aSwitch isKindOfClass:[UISwitch class]]) {
            aSwitch = [[UISwitch alloc] init];
            self.actionView = aSwitch;
        }
        aSwitch.on = viewModel.accessorySwitchOn;
    } else if (viewModel.accessoryType == LCActionCellAccessoryTypeIndicator) {
        // 图片
        UIImageView *imageView = (UIImageView *)self.actionView;
        if (!imageView || ![imageView isKindOfClass:[UIImageView class]]) {
            imageView = [[UIImageView alloc] init];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            self.actionView = imageView;
        }
        imageView.image = viewModel.accessoryImage;
    } else {
        _actionView.hidden = YES;
    }
    if (!_actionView.hidden && !self.actionView.superview) {
        [self.contentView addSubview:self.actionView];
    }

    // 分隔线
    _topLineView.hidden = YES;
    if (viewModel.showTopLine) {
        self.topLineView.hidden = NO;
        self.topLineView.backgroundColor = viewModel.lineColor;
    }
    
    _bottomLineView.hidden = YES;
    if (viewModel.showBottomLine) {
        self.bottomLineView.hidden = NO;
        self.bottomLineView.backgroundColor = viewModel.lineColor;
    }
    
    // 已计算布局,更新
    if (!CGRectIsEmpty(viewModel.textFrame)) {
        [self updateUIFrame];
    }
}

- (void)updateUIFrame {
    _iconImageView.frame = self.viewModel.iconFrame;
    _titleLabel.frame = self.viewModel.textFrame;
    _subtitleLabel.frame = self.viewModel.detailFrame;
    _valueTextButton.frame = self.viewModel.valueFrame;
    _actionView.frame = self.viewModel.accessoryFrame;
    _topLineView.frame = self.viewModel.topLineFrame;
    _bottomLineView.frame = self.viewModel.bottomLineFrame;
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    LCActionCellViewModel *viewModel = self.viewModel;
    if (!CGRectIsEmpty(viewModel.textFrame)) {
        return;
    }
    // 未计算布局,计算,更新
    [viewModel calculateLayout];
    [self updateUIFrame];
}

#pragma mark - Getter

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.contentView addSubview:imageView];
        _iconImageView = imageView;
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        
        [self.contentView addSubview:label];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        UILabel *label = [[UILabel alloc] init];

        [self.contentView addSubview:label];
        _subtitleLabel = label;
    }
    return _subtitleLabel;
}

- (UIButton *)valueTextButton {
    if (!_valueTextButton) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.contentView addSubview:button];
        _valueTextButton = button;
    }
    return _valueTextButton;
}

- (UIView *)topLineView {
    if (!_topLineView) {
        UIView *view = [[UIView alloc] init];
        
        [self.contentView addSubview:view];
        _topLineView = view;
    }
    return _topLineView;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        UIView *view = [[UIView alloc] init];
        
        [self.contentView addSubview:view];
        _bottomLineView = view;
    }
    return _bottomLineView;
}

@end
