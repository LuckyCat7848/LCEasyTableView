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
    CGFloat accessoryLeft = self.width - vm.accessoryImage.size.width - vm.accessoryEdgeInsets.right;
    self.accessoryView.frame = CGRectMake(accessoryLeft, 0, vm.accessoryImage.size.width, self.height);
    
    // icon
    CGFloat textPointX = vm.textEdgeInsets.left, detailPointX = vm.detailTextEdgeInsets.left;
    if (!self.imageView.hidden) {
        self.imageView.frame = CGRectMake(vm.iconEdgeInsets.left, 0, vm.iconSize.width, self.height);
        textPointX = self.imageView.right + vm.textEdgeInsets.left;
        detailPointX = self.imageView.right + vm.detailTextEdgeInsets.left;
    }
    
    // 标题
    self.textLabel.frame = CGRectMake(textPointX, 0, accessoryLeft - textPointX - vm.accessoryEdgeInsets.left, self.height);
    
    // 详情
    if (self.detailTextLabel.text.length || self.detailTextLabel.attributedText.string.length) {
        [self.textLabel sizeToFit];

        self.detailTextLabel.left = detailPointX;
        [self.detailTextLabel sizeToFit];
        
        self.textLabel.width = accessoryLeft - textPointX - vm.accessoryEdgeInsets.left;
        self.detailTextLabel.width = accessoryLeft - detailPointX - vm.accessoryEdgeInsets.left;

        CGFloat space = (self.height - self.textLabel.height - self.detailTextLabel.height) / 3;
        self.textLabel.top = space + 2;
        self.detailTextLabel.bottom = self.height - space - 2;
    }
    
    // icon
    self.imageView.centerY = self.textLabel.centerY;
    
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

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        UIView *view = [[UIView alloc] init];
        
        [self.contentView addSubview:view];
        _bottomLineView = view;
    }
    return _bottomLineView;
}

@end
