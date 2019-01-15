//
//  LCActionCell.m
//  1haiiPhone
//
//  Created by LuckyCat on 2018/7/31.
//  Copyright © 2018年 EHi. All rights reserved.
//

#import "LCActionCell.h"

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
    self.textLabel.frame = viewModel.textFrame;
    self.textLabel.textColor = viewModel.textColor;
    self.textLabel.font = viewModel.textFont;
    self.textLabel.textAlignment = viewModel.textAlignment;
    self.textLabel.text = viewModel.textStr;
    
    // 箭头图片
    if (viewModel.indicatorImage) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *accessoryView = [[UIImageView alloc] initWithImage:viewModel.indicatorImage];
        accessoryView.contentMode = UIViewContentModeScaleAspectFit;
        self.accessoryView = accessoryView;
        self.accessoryView.frame = viewModel.indicatorFrame;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // 分隔线
    self.topLineView.backgroundColor = viewModel.lineColor;
    self.topLineView.frame = viewModel.topLineFrame;
    
    self.bottomLineView.backgroundColor = viewModel.lineColor;
    self.bottomLineView.frame = viewModel.bottomLineFrame;
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
