//
//  LCDefines.h
//  LCTableView
//
//  Created by LuckyCat on 2019/1/16.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#ifndef LCDefines_h
#define LCDefines_h

/** 屏幕尺寸 */
#define kLCScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kLCScreenHeight [[UIScreen mainScreen] bounds].size.height

/** 线 */
#define kLCLineWidth    (1 / [UIScreen mainScreen].scale)


/** TableView数据样式 */
typedef NS_ENUM(NSInteger, LCTableViewDataStyle) {
    /** 默认:1个section,多个row */
    LCTableViewDataStyleRows,
    /** 多个section,1个row */
    LCTableViewDataStyleSections,
    /** 多个section,多个row（数据为嵌套数组） */
    LCTableViewDataStyleAll,
};

#endif /* LCDefines_h */
