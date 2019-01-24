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

/** 右侧提示文字/图片 */
 @property (nonatomic, strong) UIButton *valueTextButton;

/** 顶部分割线 */
@property (nonatomic, strong) UIView *topLineView;
/** 底部分割线 */
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation LCActionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
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
    self.imageView.hidden = !viewModel.iconImage;
    self.imageView.image = viewModel.iconImage;
    if (!self.imageView.hidden && viewModel.iconSize.width == 0 && viewModel.iconSize.height == 0) {
        viewModel.iconSize = viewModel.iconImage.size;
    }
    
    // 标题
    self.textLabel.numberOfLines = viewModel.textNumberOfLines;
    self.textLabel.textColor = viewModel.textColor;
    self.textLabel.font = viewModel.textFont;
    self.textLabel.text = viewModel.textStr;
    if (viewModel.textAttrStr) {
        self.textLabel.attributedText = viewModel.textAttrStr;
    }
    self.textLabel.textAlignment = viewModel.textAlignment;
    
    // 详情
    self.detailTextLabel.numberOfLines = viewModel.detailTextNumberOfLines;
    self.detailTextLabel.textColor = viewModel.detailTextColor;
    self.detailTextLabel.font = viewModel.detailTextFont;
    self.detailTextLabel.text = viewModel.detailTextStr;
    if (viewModel.detailTextAttrStr) {
        self.detailTextLabel.attributedText = viewModel.detailTextAttrStr;
    }
    self.detailTextLabel.textAlignment = viewModel.detailTextAlignment;
    
    // 右侧提示文字/图片
    _valueTextButton.hidden = YES;
    if (viewModel.valueImage || viewModel.valueTextStr.length || viewModel.valueTextAttrStr.length) {
        self.valueTextButton.hidden = NO;
        [self.valueTextButton setTitleColor:viewModel.valueTextColor forState:UIControlStateNormal];
        self.valueTextButton.titleLabel.font = viewModel.valueTextFont;
        
        if (viewModel.valueImage) {
            [self.valueTextButton setImage:viewModel.valueImage forState:UIControlStateNormal];
            if (viewModel.valueSize.width == 0 && viewModel.valueSize.height == 0) {
                viewModel.valueSize = viewModel.valueImage.size;
            }
        } else if (viewModel.valueTextAttrStr) {
            [self.valueTextButton setAttributedTitle:viewModel.valueTextAttrStr forState:UIControlStateNormal];
        } else {
            [self.valueTextButton setTitle:viewModel.valueTextStr forState:UIControlStateNormal];
        }
        self.valueTextButton.titleLabel.textAlignment = NSTextAlignmentRight;
    }
    
    // 箭头
    if (viewModel.accessoryType == LCActionCellAccessoryTypeSwitch) {
        // 开关
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UISwitch *aSwitch = (UISwitch *)self.accessoryView;
        if (!aSwitch || ![aSwitch isKindOfClass:[UISwitch class]]) {
            aSwitch = [[UISwitch alloc] init];
            self.accessoryView = aSwitch;
        }
        aSwitch.on = viewModel.accessorySwitchOn;
    } else if (viewModel.accessoryType == LCActionCellAccessoryTypeIndicator) {
        // 图片
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *imageView = (UIImageView *)self.accessoryView;
        if (!imageView || ![imageView isKindOfClass:[UIImageView class]]) {
            imageView = [[UIImageView alloc] init];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            self.accessoryView = imageView;
        }
        imageView.image = viewModel.accessoryImage;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = nil;
    }
    
    // 分隔线
    self.topLineView.backgroundColor = viewModel.lineColor;
    self.topLineView.hidden = !viewModel.showTopLine;
    
    self.bottomLineView.backgroundColor = viewModel.lineColor;
    self.bottomLineView.hidden = !viewModel.showBottomLine;
}

#pragma mark - Layout

- (void)layoutSubviews {
    [super layoutSubviews];
    
    LCActionCellViewModel *vm = self.viewModel;
    
    // 箭头
    CGFloat valueRight = self.width - vm.valueTextEdgeInsets.right;
    CGFloat textRight = self.width - vm.accessoryEdgeInsets.right;
    CGFloat detailRight = self.width - vm.accessoryEdgeInsets.right;
    if (self.accessoryType != UITableViewCellAccessoryNone) {
        CGFloat accessoryWidth = vm.accessoryImage.size.width;
        CGFloat accessoryHeight = vm.accessoryImage.size.height;
        if (vm.accessoryType == LCActionCellAccessoryTypeSwitch) {
            accessoryWidth = 51;
            accessoryHeight = 31;
        }
        textRight -= accessoryWidth;
        self.accessoryView.frame = CGRectMake(textRight, (self.height - accessoryHeight) / 2, accessoryWidth, accessoryHeight);
        valueRight = textRight - vm.valueTextEdgeInsets.right;
        
        textRight -= vm.accessoryEdgeInsets.left;
        detailRight -= vm.accessoryEdgeInsets.left;
    }
    
    // 右侧提示文字/图片
    if (_valueTextButton && !_valueTextButton.hidden) {
        if (vm.valueImage.size.width) {
            _valueTextButton.frame = CGRectMake(0, 0, vm.valueSize.width, vm.valueSize.height);
        } else {
            [_valueTextButton sizeToFit];
            if (_valueTextButton.width > self.width / 2) {
                _valueTextButton.width = self.width / 2;
            }
        }
        _valueTextButton.right = valueRight;
        textRight = _valueTextButton.left - vm.valueTextEdgeInsets.left;
        detailRight = _valueTextButton.right;
    }
    
    // icon
    CGFloat textPointX = vm.textEdgeInsets.left, detailPointX = vm.detailTextEdgeInsets.left;
    if (!self.imageView.hidden) {
        self.imageView.frame = CGRectMake(vm.iconEdgeInsets.left, 0, vm.iconSize.width, self.height);
        textPointX = self.imageView.right + vm.textEdgeInsets.left;
        detailPointX = self.imageView.right + vm.detailTextEdgeInsets.left;
    }
    
    // 标题
    self.textLabel.frame = CGRectMake(textPointX, 0, textRight - textPointX, self.height);
    
    // 详情
    if (self.detailTextLabel.text.length || self.detailTextLabel.attributedText.length) {
        [self.textLabel sizeToFit];

        self.detailTextLabel.left = detailPointX;
        [self.detailTextLabel sizeToFit];
        
        self.textLabel.width = textRight - textPointX;
        self.detailTextLabel.width = detailRight - detailPointX;

        CGFloat space = (self.height - self.textLabel.height - self.detailTextLabel.height) / 3;
        self.textLabel.top = space + 2;
        self.detailTextLabel.bottom = self.height - space - 2;
    }
    
    // icon、value,centerY
    self.imageView.centerY = self.textLabel.centerY;
    _valueTextButton.centerY = self.accessoryView.centerY;
    if (self.detailTextLabel.text.length || self.detailTextLabel.attributedText.length) {
        _valueTextButton.centerY = self.textLabel.centerY;
    }

    // 上/下线
    _topLineView.frame = CGRectMake(vm.topLineInsets.left, vm.topLineInsets.top, self.width - vm.topLineInsets.left - vm.topLineInsets.right, vm.lineWidth);
    
    _bottomLineView.frame = CGRectMake(vm.bottomLineInsets.left, self.height - vm.lineWidth - vm.bottomLineInsets.bottom, self.width - vm.bottomLineInsets.left - vm.bottomLineInsets.right, vm.lineWidth);
}

#pragma mark - Getter

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
