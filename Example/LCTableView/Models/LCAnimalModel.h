//
//  LCAnimalModel.h
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/10.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EHICellModelProtocol.h"

/** 动物类型 */
typedef NS_ENUM(NSInteger, LCAnimalType) {
    LCAnimalTypeCat, /// 猫
    LCAnimalTypeGog, /// 狗
};

@interface LCAnimalModel : NSObject<EHICellModelProtocol>

/** Id */
@property (nonatomic, assign) NSInteger Id;

/** 动物名字 */
@property (nonatomic, copy) NSString *Name;

/** 动物类型  */
@property (nonatomic, assign) LCAnimalType Type;

/** 类型名称 */
@property (nonatomic, copy) NSString *typeName;

@end
