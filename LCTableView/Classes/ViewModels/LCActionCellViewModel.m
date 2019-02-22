//
//  LCActionCellViewModel.m
//  1haiiPhone
//
//  Created by LuckyCat on 2018/7/31.
//  Copyright © 2018年 EHi. All rights reserved.
//

#import "LCActionCellViewModel.h"
#import "LCDefines.h"

@implementation LCActionCellViewModel

SetCellClass(LCActionCell);

- (instancetype)init {
    self = [super init];
    if (self) {
        // 默认设置
        _cellHeight = 44;
        
        // 间距
        _iconEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
        _textEdgeInsets = UIEdgeInsetsMake(16, 16, 0, 0);
        _detailTextEdgeInsets = UIEdgeInsetsMake(8, 16, 16, 0);
        _valueTextEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 16);
        _accessoryEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 16);
        
        // 标题
        _textColor = [UIColor blackColor];
        _textFont = [UIFont systemFontOfSize:15];
        _textAlignment = NSTextAlignmentLeft;
        _textNumberOfLines = 1;
        
        // 详情
        _detailTextColor = [UIColor lightGrayColor];
        _detailTextFont = [UIFont systemFontOfSize:12];
        _detailTextAlignment = NSTextAlignmentLeft;
        _detailTextNumberOfLines = 1;

        // 右侧提示文字/图片
        _valueTextColor = [UIColor lightGrayColor];
        _valueTextFont = [UIFont systemFontOfSize:12];
        
        // 箭头图片/开关
        _accessoryImage = [UIImage imageNamed:@"arrow_right"];
        
        // 分割线
        _lineColor = [UIColor lightGrayColor];
        _lineWidth = kLCLineWidth;
        _showTopLine = NO;
        _showBottomLine = NO;
    }
    return self;
}

/**
 固定高度：自适应布局(不调用的话cell中会调用)
 */
- (void)calculateLayout {
    [self updateUIWithCalculateCellHeight:NO];
}

/**
 计算高度：所有设置完成后,调用
 */
- (void)calculateCellHeight {
    [self updateUIWithCalculateCellHeight:YES];
}

/** 计算布局 */
- (void)updateUIWithCalculateCellHeight:(BOOL)needCalculateCellHeight {
    // 箭头
    CGFloat valueRight = kLCScreenWidth - _valueTextEdgeInsets.right;
    CGFloat textRight = kLCScreenWidth - _accessoryEdgeInsets.right;
    CGFloat detailRight = kLCScreenWidth - _accessoryEdgeInsets.right;
    if (_accessoryType != UITableViewCellAccessoryNone) {
        CGFloat accessoryWidth = _accessoryImage.size.width;
        CGFloat accessoryHeight = _accessoryImage.size.height;
        if (_accessoryType == LCActionCellAccessoryTypeSwitch) {
            accessoryWidth = 51;
            accessoryHeight = 31;
        }
        _accessoryFrame = CGRectMake(textRight - accessoryWidth, 0, accessoryWidth, accessoryHeight);
        
        valueRight = CGRectGetMinX(_accessoryFrame) - _valueTextEdgeInsets.right;
        textRight = CGRectGetMinX(_accessoryFrame) - _accessoryEdgeInsets.left;
        detailRight = CGRectGetMinX(_accessoryFrame) - _accessoryEdgeInsets.left;
    }
    
    // 右侧提示文字/图片
    if (_valueImage || _valueTextStr.length || _valueTextAttrStr.length) {
        if (_valueImage) {
            if (_valueSize.width == 0 || _valueSize.height == 0) {
                _valueSize = _valueImage.size;
            }
            _valueTextAttrStr = [NSMutableAttributedString attachmentStringWithContent:_valueImage contentMode:UIViewContentModeCenter attachmentSize:_valueImage.size alignToFont:_valueTextFont alignment:YYTextVerticalAlignmentCenter];
            _valueTextAttrStr.font = _valueTextFont;
        } else if (!_valueTextAttrStr) {
            _valueTextAttrStr = [[NSMutableAttributedString alloc] initWithString:_valueTextStr
                                                                       attributes:@{NSFontAttributeName : _valueTextFont,
                                                                                    NSForegroundColorAttributeName : _valueTextColor}];
        }
        _textAttrStr.alignment = _textAlignment;
        CGSize valueSize = [self calculateValueSize];
        _valueFrame = CGRectMake((valueRight - valueSize.width), 0, valueSize.width, valueSize.height);

        textRight = CGRectGetMinX(_valueFrame) - _valueTextEdgeInsets.left;
        detailRight = valueRight;
    }
    
    // icon
    CGFloat textPointX = _textEdgeInsets.left, detailPointX = _detailTextEdgeInsets.left;
    if (_iconImage) {
        if (_iconSize.width == 0 || _iconSize.height == 0) {
            _iconSize = _iconImage.size;
        }
        _iconFrame = CGRectMake(_iconEdgeInsets.left, 0, _iconSize.width, _iconSize.height);

        textPointX = CGRectGetMaxX(_iconFrame) + _textEdgeInsets.left;
        detailPointX = CGRectGetMaxX(_iconFrame) + _detailTextEdgeInsets.left;
    }
    
    // 标题
    if (!_textAttrStr) {
        _textAttrStr = [[NSMutableAttributedString alloc] initWithString:_textStr
                                                                  attributes:@{NSFontAttributeName : _textFont,
                                                                               NSForegroundColorAttributeName : _textColor}];
    }
    _textAttrStr.alignment = _textAlignment;
    
    CGFloat textWidth = textRight - textPointX;
    CGSize textSize = [self calculateTextSize:textWidth];
    
    // 详情
    if (_detailTextStr.length || _detailTextAttrStr.length) {
        if (!_detailTextAttrStr) {
            _detailTextAttrStr = [[NSMutableAttributedString alloc] initWithString:_detailTextStr
                                                                            attributes:@{NSFontAttributeName : _detailTextFont,
                                                                                         NSForegroundColorAttributeName : _detailTextColor}];
        }
        _detailTextAttrStr.alignment = _detailTextAlignment;
        
        CGFloat detailWidth = detailRight - detailPointX;
        CGSize detailSize = [self calculateDetailTextSize:detailWidth];
        
        CGFloat totalHeight = _textEdgeInsets.top + textSize.height + (_textEdgeInsets.bottom + _detailTextEdgeInsets.top) + detailSize.height + _detailTextEdgeInsets.bottom;
        if (needCalculateCellHeight) {
            _cellHeight = totalHeight;
        } else {
            // 自适应布局,调整间距、行数
            if (ABS(totalHeight - _cellHeight) > 5) {
                CGFloat space = (_cellHeight - textSize.height - detailSize.height) / 3;
                CGFloat diff = space / 3;
                if (_cellHeight < (textSize.height + detailSize.height)) {
                    _textNumberOfLines = 1;
                    _detailTextNumberOfLines = 1;
                    textSize = [self calculateTextSize:textWidth];
                    detailSize = [self calculateDetailTextSize:detailWidth];
                    
                    space = (_cellHeight - textSize.height - detailSize.height) / 3;
                    diff = 0;
                }
                UIEdgeInsets tmpText = _textEdgeInsets;
                UIEdgeInsets tmpDetail = _detailTextEdgeInsets;
                tmpText.top = tmpDetail.bottom = space + diff;
                tmpText.bottom = tmpDetail.top = (space - diff * 2) / 2;
                _textEdgeInsets = tmpText;
                _detailTextEdgeInsets = tmpDetail;
            }
        }
        _textFrame = CGRectMake(textPointX, _textEdgeInsets.top, textSize.width, textSize.height);
        _detailFrame = CGRectMake(detailPointX, CGRectGetMaxY(_textFrame) + (_textEdgeInsets.bottom + _detailTextEdgeInsets.top), detailSize.width, detailSize.height);
    } else {
        if (needCalculateCellHeight) {
            _cellHeight = _textEdgeInsets.top + textSize.height + _detailTextEdgeInsets.bottom;
        }
        // 自适应布局
        if (textSize.height > _cellHeight) {
            _textNumberOfLines = 1;
        }
        _textFrame = CGRectMake(textPointX, 0, textSize.width, _cellHeight);
    }
    
    // 垂直居中布局
    _accessoryFrame.origin.y = (_cellHeight - CGRectGetHeight(_accessoryFrame)) / 2;
    _iconFrame.origin.y = CGRectGetMinY(_textFrame) + (CGRectGetHeight(_textFrame) - CGRectGetHeight(_iconFrame)) / 2;
    
    if (_detailTextStr.length || _detailTextAttrStr.length) {
        _valueFrame.origin.y = CGRectGetMinY(_textFrame) + (CGRectGetHeight(_textFrame) - CGRectGetHeight(_valueFrame)) / 2;
    } else {
        _valueFrame.origin.y = CGRectGetMinY(_accessoryFrame) + (CGRectGetHeight(_accessoryFrame) - CGRectGetHeight(_valueFrame)) / 2;
    }
    
    // 上/下线
    _topLineFrame = CGRectMake(_topLineInsets.left, _topLineInsets.top, kLCScreenWidth - _topLineInsets.left - _topLineInsets.right, _lineWidth);
    _bottomLineFrame = CGRectMake(_bottomLineInsets.left, _cellHeight - _lineWidth - _bottomLineInsets.bottom, kLCScreenWidth - _bottomLineInsets.left - _bottomLineInsets.right, _lineWidth);
}

#pragma mark - 分别计算size

- (CGSize)calculateValueSize {
    _valueTextLayout = [self textLayout:_valueTextAttrStr containerSize:CGSizeMake(CGFLOAT_MAX, _valueTextFont.lineHeight) numberOfLines:1];
    CGSize valueSize = _valueTextLayout.textBoundingSize;
    if (valueSize.width > kLCScreenWidth / 2) {
        valueSize.width = kLCScreenWidth / 2;
    }
    return valueSize;
}

- (CGSize)calculateTextSize:(CGFloat)width {
    _textLayout = [self textLayout:_textAttrStr containerSize:CGSizeMake(width, CGFLOAT_MAX) numberOfLines:_textNumberOfLines];
    CGSize textSize = _textLayout.textBoundingSize;
    if ((textSize.width > width) || (_textAlignment == NSTextAlignmentCenter) || (_textAlignment == NSTextAlignmentRight)) {
        textSize.width = width;
    }
    return textSize;
}

- (CGSize)calculateDetailTextSize:(CGFloat)width {
    _detailTextLayout = [self textLayout:_detailTextAttrStr containerSize:CGSizeMake(width, CGFLOAT_MAX) numberOfLines:_detailTextNumberOfLines];
    CGSize detailSize = _detailTextLayout.textBoundingSize;
    if ((detailSize.width > width) || (_detailTextAlignment == NSTextAlignmentCenter) || (_detailTextAlignment == NSTextAlignmentRight)) {
        detailSize.width = width;
    }
    return detailSize;
}

#pragma mark - Tool Methods

/** 计算YYTextLayout */
- (YYTextLayout *)textLayout:(NSMutableAttributedString *)attrString containerSize:(CGSize)containerSize numberOfLines:(NSInteger)numberOfLines {
    YYTextContainer *container = [YYTextContainer containerWithSize:containerSize];
    container.maximumNumberOfRows = numberOfLines;
    container.truncationType = YYTextTruncationTypeEnd;
    YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:attrString];
    return layout;
}

@end
