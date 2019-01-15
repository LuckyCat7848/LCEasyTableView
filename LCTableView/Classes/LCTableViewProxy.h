//
//  LCTableViewProxy.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCTableViewProxy : NSObject

/** 默认imp实现代理方法 */
@property (nonatomic, weak) id<UITableViewDelegate, UITableViewDataSource> impDelegate;

/** 使用者额外想实现代理方法（UIViewController/UIView...） */
@property (nonatomic, weak) id<UITableViewDelegate, UITableViewDataSource> extraDelegate;

@end
