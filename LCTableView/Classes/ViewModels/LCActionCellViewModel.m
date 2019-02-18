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
        _textEdgeInsets = UIEdgeInsetsMake(16, 16, 16, 0);
        _detailTextEdgeInsets = UIEdgeInsetsMake(6, 16, 16, 0);
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

/** 计算高度:所有设置完成后,若需要根据内容计算高度,调用该方法 */
- (void)calculateCellHeight {
    self.cellHeight = 44;
    
    // 箭头
    CGFloat valueRight = kLCScreenWidth - self.valueTextEdgeInsets.right;
    CGFloat textRight = kLCScreenWidth - self.accessoryEdgeInsets.right;
    CGFloat detailRight = kLCScreenWidth - self.accessoryEdgeInsets.right;
    if (self.accessoryType != UITableViewCellAccessoryNone) {
        CGFloat accessoryWidth = self.accessoryImage.size.width;
        CGFloat accessoryHeight = self.accessoryImage.size.height;
        if (self.accessoryType == LCActionCellAccessoryTypeSwitch) {
            accessoryWidth = 51;
            accessoryHeight = 31;
        }
        textRight -= accessoryWidth;
        valueRight = textRight - self.valueTextEdgeInsets.right;
        
        textRight -= self.accessoryEdgeInsets.left;
        detailRight -= self.accessoryEdgeInsets.left;
    }
    
    // 右侧提示文字/图片
    if (self.valueImage || self.valueTextStr.length || self.valueTextAttrStr.length) {
        CGFloat valueWidth = 0;
        if (self.valueImage.size.width) {
            valueWidth = self.valueSize.width;
        } else {
            NSAttributedString *valueAttrStr = nil;
            if (self.valueTextAttrStr) {
                valueAttrStr = self.valueTextAttrStr;
            } else {
                valueAttrStr = [[NSAttributedString alloc] initWithString:self.valueTextStr attributes:@{NSFontAttributeName : self.valueTextFont}];
            }
            NSRange valueRange = NSMakeRange(0, valueAttrStr.length);
            valueWidth = [valueAttrStr.string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.valueTextFont.pointSize + 5) options:NSStringDrawingUsesLineFragmentOrigin attributes:[valueAttrStr attributesAtIndex:0 effectiveRange:&valueRange] context:nil].size.width;
            
            if (valueWidth > kLCScreenWidth / 2) {
                valueWidth = kLCScreenWidth / 2;
            }
        }
        textRight = (valueRight - valueWidth) - self.valueTextEdgeInsets.left;
        detailRight = valueRight;
    }
    
    // icon
    CGFloat textPointX = self.textEdgeInsets.left, detailPointX = self.detailTextEdgeInsets.left;
    if (!self.iconImage) {
        CGFloat iconRight = self.iconEdgeInsets.left + self.iconSize.width;
        textPointX = iconRight + self.textEdgeInsets.left;
        detailPointX = iconRight + self.detailTextEdgeInsets.left;
    }
    
    // 标题
//    self.textLabel.frame = CGRectMake(textPointX, 0, textRight - textPointX, self.height);
    CGFloat textWidth = textPointX + (textRight - textPointX);
    
    // 计算textLabel的高度
    NSAttributedString *textAttrStr = nil;
    if (self.textAttrStr) {
        textAttrStr = self.textAttrStr;
    } else {
        textAttrStr = [[NSAttributedString alloc] initWithString:self.textStr attributes:@{NSFontAttributeName : self.textFont}];
    }
    NSRange textRange = NSMakeRange(0, textAttrStr.length);
    CGFloat textHeight = (self.textNumberOfLines == 1) ? self.textFont.pointSize : [textAttrStr.string boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[textAttrStr attributesAtIndex:0 effectiveRange:&textRange]  context:nil].size.height;
    
    CGFloat space = 5;
    CGFloat textTop = space + 2;
    CGFloat detailBottom = space + 2;
    
    
    // 详情
    if (self.detailTextStr.length || self.detailTextAttrStr.length) {
//        [self.textLabel sizeToFit];
        
//        self.detailTextLabel.left = detailPointX;
//        [self.detailTextLabel sizeToFit];
        
        NSAttributedString *detailAttrStr = nil;
        if (self.detailTextAttrStr) {
            detailAttrStr = self.detailTextAttrStr;
        } else {
            detailAttrStr = [[NSAttributedString alloc] initWithString:self.detailTextStr attributes:@{NSFontAttributeName : self.detailTextFont}];
        }
        CGFloat detailWidth = detailRight - detailPointX;
        NSRange detailRange = NSMakeRange(0, detailAttrStr.length);
        CGFloat detailHeight = (self.detailTextNumberOfLines == 1) ? self.detailTextFont.pointSize : [detailAttrStr.string boundingRectWithSize:CGSizeMake(detailWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[detailAttrStr attributesAtIndex:0 effectiveRange:&detailRange] context:nil].size.height;

        textWidth = textRight - textPointX;
        textHeight = (self.textNumberOfLines == 1) ? self.textFont.pointSize : [textAttrStr.string boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[textAttrStr attributesAtIndex:0 effectiveRange:&textRange]  context:nil].size.height;
        self.cellHeight = textTop + textHeight + space + detailHeight + detailBottom;
    } else {
        self.cellHeight = textTop + textHeight + detailBottom;
    }
    
    if (self.cellHeight < 44) {
        self.cellHeight = 44;
    }
    NSLog(@"%.2f", self.cellHeight);
}

@end
