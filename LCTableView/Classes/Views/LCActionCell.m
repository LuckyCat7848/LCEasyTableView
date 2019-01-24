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
 @property (nonatomic, strong) UILabel *valueTextLabel;

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
    _valueTextLabel.hidden = YES;
    if (viewModel.valueTextStr.length || viewModel.valueTextAttrStr.length) {
        self.valueTextLabel.hidden = NO;
        self.valueTextLabel.textColor = viewModel.valueTextColor;
        self.valueTextLabel.font = viewModel.valueTextFont;
        self.valueTextLabel.text = viewModel.valueTextStr;
        if (viewModel.valueTextAttrStr) {
            self.valueTextLabel.attributedText = viewModel.valueTextAttrStr;
        }
        self.valueTextLabel.textAlignment = NSTextAlignmentRight;
    }
    
    // 箭头图片
    if (viewModel.accessoryImage) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *accessoryView = [[UIImageView alloc] initWithImage:viewModel.accessoryImage];
        accessoryView.contentMode = UIViewContentModeScaleAspectFit;
        self.accessoryView = accessoryView;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
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
    if (vm.accessoryImage.size.width) {
        textRight -= vm.accessoryImage.size.width;
        self.accessoryView.frame = CGRectMake(textRight, 0, vm.accessoryImage.size.width, self.height);
        valueRight = textRight - vm.valueTextEdgeInsets.right;
        
        textRight -= vm.accessoryEdgeInsets.left;
        detailRight -= vm.accessoryEdgeInsets.left;
    }
    
    // 右侧提示文字/图片
    if (_valueTextLabel && !_valueTextLabel.hidden) {
        [_valueTextLabel sizeToFit];
        if (_valueTextLabel.width > self.width / 2) {
            _valueTextLabel.width = self.width / 2;
        }
        _valueTextLabel.right = valueRight;
        textRight = _valueTextLabel.left - vm.valueTextEdgeInsets.left;
        detailRight = _valueTextLabel.right;
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
    _valueTextLabel.centerY = self.textLabel.centerY;
    if (vm.accessoryImage.size.width) {
        _valueTextLabel.centerY = self.accessoryView.centerY;
    }

    // 上/下线
    _topLineView.frame = CGRectMake(vm.topLineInsets.left, vm.topLineInsets.top, self.width - vm.topLineInsets.left - vm.topLineInsets.right, vm.lineWidth);
    
    _bottomLineView.frame = CGRectMake(vm.bottomLineInsets.left, self.height - vm.lineWidth - vm.bottomLineInsets.bottom, self.width - vm.bottomLineInsets.left - vm.bottomLineInsets.right, vm.lineWidth);
}

#pragma mark - Getter

- (UILabel *)valueTextLabel {
    if (!_valueTextLabel) {
        UILabel *label = [[UILabel alloc] init];
        
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
