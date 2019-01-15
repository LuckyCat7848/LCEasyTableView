//
//  EHICellModelProtocol.h
//  LCTableView
//
//  Created by LuckyCat on 2019/1/15.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EHICellModelProtocol <NSObject>

@optional

/** 标识类型(用于一个tableView多种Type时标识用) */
@property (nonatomic, assign) NSInteger identityType;

//@required

//@property (nonatomic, assign) CGFloat cellHeight;
//@property (nonatomic, strong) id model;

+ (Class)cellClass;

@property (nonatomic, copy) NSString *cellClass;

@end
