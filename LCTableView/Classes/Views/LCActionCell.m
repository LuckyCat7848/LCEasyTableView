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
    
    // 文字
    self.textLabel.textColor = viewModel.textColor;
    self.textLabel.font = viewModel.textFont;
    self.textLabel.textAlignment = viewModel.textAlignment;
    self.textLabel.text = viewModel.textStr;
    self.textLabel.numberOfLines = 0;
    
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
    
    CGFloat accessoryLeft = self.width - vm.indicatorImage.size.width - vm.textLeft;
    self.accessoryView.frame = CGRectMake(accessoryLeft, 0, vm.indicatorImage.size.width, self.height);
    
    self.textLabel.frame = CGRectMake(vm.textLeft, 0, accessoryLeft - vm.textLeft - 10, self.height);
    
    self.topLineView.frame = CGRectMake(vm.topLineInsets.left, 0, self.width - vm.topLineInsets.left - vm.topLineInsets.right, kLCLineWidth);
    
    self.bottomLineView.frame = CGRectMake(vm.bottomLineInsets.left, self.height - kLCLineWidth, self.width - vm.bottomLineInsets.left - vm.bottomLineInsets.right, kLCLineWidth);
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
