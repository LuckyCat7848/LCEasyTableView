//
//  LCTableViewDefines.h
//  LCTableView
//
//  Created by LuckyCat on 2019/1/15.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#ifndef LCTableViewDefines_h
#define LCTableViewDefines_h

/** 数据格式样式 */
typedef NS_ENUM(NSInteger, LCTableViewDataStyle) {
    /** 默认:1个section,多个row */
    LCTableViewDataStyleRows,
    /** 多个section,1个row */
    LCTableViewDataStyleSections,
    /** 多个section,多个row（数据为嵌套数组） */
    LCTableViewDataStyleAll,
};

#endif /* LCTableViewDefines_h */
