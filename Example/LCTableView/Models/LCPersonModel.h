//
//  LCPersonModel.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/17.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCCellDataProtocol.h"

@interface LCPersonModel : NSObject<LCCellDataProtocol>

/** Id */
@property (nonatomic, assign) NSInteger Id;

/** 人名字 */
@property (nonatomic, copy) NSString *Name;

#pragma mark - LCCellDataProtocol

@property (nonatomic, assign) CGFloat cellHeight;

+ (Class)cellClass;

@end
