//
//  LCTableViewProxy.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCTableViewProxy : NSObject

@property (nonatomic, strong, readonly) NSPointerArray *targets;

- (void)addTarget:(id)target;
- (void)removeTarget:(id)target;

@end
