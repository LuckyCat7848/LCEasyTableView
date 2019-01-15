//
//  LCAnimalCellViewModel.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/15.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCCellDataProtocol.h"
#import "LCAnimalModel.h"

@interface LCAnimalCellViewModel : NSObject<LCCellDataProtocol>

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) LCAnimalModel *model;

@property (nonatomic, copy) NSString *nameString;

+ (Class)cellClass;
+ (LCCellDataType)cellDataType;

@end
