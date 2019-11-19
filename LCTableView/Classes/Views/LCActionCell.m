//
//  LCActionCell.m
//  1haiiPhone
//
//  Created by LuckyCat on 2018/7/31.
//  Copyright © 2018年 EHi. All rights reserved.
//

#import "LCActionCell.h"
#import "LCDefines.h"

@interface LCActionCell ()

/** icon */
@property (nonatomic, strong) UIImageView *iconImageView;
/** 文字 */
@property (nonatomic, strong) YYLabel *titleLabel;
/** 详情 */
@property (nonatomic, strong) YYLabel *subtitleLabel;

/** 右侧提示文字/图片 */
 @property (nonatomic, strong) YYLabel *valueTextLabel;
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
    self.titleLabel.textLayout = viewModel.textLayout;
    
    // 详情
    _subtitleLabel.hidden = YES;
    if (viewModel.detailTextAttrStr) {
        self.subtitleLabel.hidden = NO;
        self.subtitleLabel.textLayout = viewModel.detailTextLayout;
    }

    // 右侧提示文字/图片
    _valueTextLabel.hidden = YES;
    if (viewModel.valueTextAttrStr) {
        self.valueTextLabel.hidden = NO;
        self.valueTextLabel.textLayout = viewModel.valueTextLayout;
    }
    
    // 箭头
    _actionView.hidden = NO;
    if (viewModel.accessoryType == LCActionCellAccessoryTypeSwitch) {
        // 开关
        UISwitch *aSwitch = (UISwitch *)self.actionView;
        if (!aSwitch || ![aSwitch isKindOfClass:[UISwitch class]]) {
            aSwitch.hidden = YES;
            aSwitch = [[UISwitch alloc] init];
            [aSwitch addTarget:self action:@selector(accessoryTapAction) forControlEvents:UIControlEventTouchUpInside];
            self.actionView = aSwitch;
        }
        aSwitch.on = viewModel.accessorySwitchOn;
    } else if (viewModel.accessoryType == LCActionCellAccessoryTypeIndicator) {
        // 图片
        UIImageView *imageView = (UIImageView *)self.actionView;
        if (!imageView || ![imageView isKindOfClass:[UIImageView class]]) {
            imageView.hidden = YES;
            imageView = [[UIImageView alloc] init];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            
            imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(accessoryTapAction)];
            [imageView addGestureRecognizer:tapGesture];
            
            self.actionView = imageView;
        }
        imageView.image = viewModel.accessoryImage;
    } else {
        _actionView.hidden = YES;
    }
    if (!_actionView.hidden && !_actionView.superview) {
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
    
    // 响应事件
    [self updateInteractionEnabled];

    // 已计算布局,更新
    if (!CGRectIsEmpty(viewModel.textFrame)) {
        [self updateUIFrame];
    }
}

- (void)updateInteractionEnabled {
    _iconImageView.userInteractionEnabled = (self.viewModel.iconActionBlock != nil);
    _titleLabel.userInteractionEnabled = (self.viewModel.textActionBlock != nil);
    _subtitleLabel.userInteractionEnabled = (self.viewModel.detailTextActionBlock != nil);
    _valueTextLabel.userInteractionEnabled = (self.viewModel.valueActionBlock != nil);
    _actionView.userInteractionEnabled = (self.viewModel.accessoryActionBlock != nil);
}

- (void)updateUIFrame {
    _iconImageView.frame = self.viewModel.iconFrame;
    _titleLabel.frame = self.viewModel.textFrame;
    _subtitleLabel.frame = self.viewModel.detailFrame;
    _valueTextLabel.frame = self.viewModel.valueFrame;
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
    [self setViewModel:viewModel];
}

#pragma mark - Action

- (void)iconTapAction {
    if (self.viewModel.iconActionBlock) {
        self.viewModel.iconActionBlock();
    }
}

- (void)textTapAction {
    if (self.viewModel.textActionBlock) {
        self.viewModel.textActionBlock();
    }
}

- (void)detailTextTapAction {
    if (self.viewModel.detailTextActionBlock) {
        self.viewModel.detailTextActionBlock();
    }
}

- (void)valueTapAction {
    if (self.viewModel.valueActionBlock) {
        self.viewModel.valueActionBlock();
    }
}

- (void)accessoryTapAction {
    if (self.viewModel.accessoryActionBlock) {
        self.viewModel.accessoryActionBlock();
    }
}

#pragma mark - Getter

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconTapAction)];
        [imageView addGestureRecognizer:tapGesture];
        
        [self.contentView addSubview:imageView];
        _iconImageView = imageView;
    }
    return _iconImageView;
}

- (YYLabel *)titleLabel {
    if (!_titleLabel) {
        YYLabel *label = [[YYLabel alloc] init];
        
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textTapAction)];
        [label addGestureRecognizer:tapGesture];
        
        [self.contentView addSubview:label];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (YYLabel *)subtitleLabel {
    if (!_subtitleLabel) {
        YYLabel *label = [[YYLabel alloc] init];

        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(detailTextTapAction)];
        [label addGestureRecognizer:tapGesture];
        
        [self.contentView addSubview:label];
        _subtitleLabel = label;
    }
    return _subtitleLabel;
}

- (YYLabel *)valueTextLabel {
    if (!_valueTextLabel) {
        YYLabel *label = [[YYLabel alloc] init];
        
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(valueTapAction)];
        [label addGestureRecognizer:tapGesture];
        
        [self.contentView addSubview:label];
        _valueTextLabel = label;
    }
    return _valueTextLabel;
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
