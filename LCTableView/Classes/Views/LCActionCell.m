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

/** 顶部分割线 */
@property (nonatomic, strong) UIView *topLineView;
/** icon */
@property (nonatomic, strong) UIImageView *iconImageView;
/** 底部分割线 */
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation LCActionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
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
    self.iconImageView.hidden = !viewModel.iconImage;
    self.iconImageView.image = viewModel.iconImage;
    if (!self.iconImageView.hidden && viewModel.iconSize.width == 0 && viewModel.iconSize.height == 0) {
        viewModel.iconSize = viewModel.iconImage.size;
    }
    
    // 文字
    self.textLabel.numberOfLines = 0;
    self.textLabel.textColor = viewModel.textColor;
    self.textLabel.font = viewModel.textFont;
    self.textLabel.text = viewModel.textStr;
    if (viewModel.textAttrStr) {
        self.textLabel.attributedText = viewModel.textAttrStr;
    }
    self.textLabel.textAlignment = viewModel.textAlignment;
    
    // 箭头图片
    if (viewModel.indicatorImage) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *accessoryView = [[UIImageView alloc] initWithImage:viewModel.indicatorImage];
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
    CGFloat accessoryLeft = self.width - vm.indicatorImage.size.width - vm.spaceHorizontal;
    self.accessoryView.frame = CGRectMake(accessoryLeft, 0, vm.indicatorImage.size.width, self.height);
    
    // icon
    CGFloat pointX = vm.spaceHorizontal, textRight = 0;
    if (!_iconImageView.hidden) {
        _iconImageView.frame = CGRectMake(pointX, 0, vm.iconSize.width, self.height);
        pointX = _iconImageView.right + vm.iconAndTextSpaceH;
        textRight = vm.textAndIndicatorSpaceH;
    }
    
    // 文字
    self.textLabel.frame = CGRectMake(pointX, 0, accessoryLeft - pointX - textRight, self.height);
    
    // 上/下线
    _topLineView.frame = CGRectMake(vm.topLineInsets.left, vm.topLineInsets.top, self.width - vm.topLineInsets.left - vm.topLineInsets.right, vm.lineWidth);
    
    _bottomLineView.frame = CGRectMake(vm.bottomLineInsets.left, self.height - vm.lineWidth - vm.bottomLineInsets.bottom, self.width - vm.bottomLineInsets.left - vm.bottomLineInsets.right, vm.lineWidth);
}

#pragma mark - Getter

- (UIView *)topLineView {
    if (!_topLineView) {
        UIView *view = [[UIView alloc] init];
        
        [self.contentView addSubview:view];
        _topLineView = view;
    }
    return _topLineView;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.contentView addSubview:imageView];
        _iconImageView = imageView;
    }
    return _iconImageView;
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
