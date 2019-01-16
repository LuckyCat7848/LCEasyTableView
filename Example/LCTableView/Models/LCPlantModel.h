//
//  LCPlantModel.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/15.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCCellDataProtocol.h"

@interface LCPlantModel : NSObject<LCCellDataProtocol>

/** Id */
@property (nonatomic, assign) NSInteger Id;

/** 植物名字 */
@property (nonatomic, copy) NSString *Name;


#pragma mark - LCCellDataProtocol

@property (nonatomic, assign) CGFloat cellHeight;

+ (Class)cellClass;
+ (LCCellDataType)cellDataType;

@end
