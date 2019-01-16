//
//  LCCellDataProtocol.h
//  LCTableView
//
//  Created by LuckyCat on 2019/1/15.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//
//  cell数据的协议：model或viewModel遵循该协议
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define LCClass(_name_) NSClassFromString(((__bridge NSString *)CFSTR(#_name_)))

#define SetCellClass(className) \
+ (Class)cellClass {\
static Class class;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
class = LCClass(className);\
});\
return class;\
}\

#define SetCellDataType(dataTypeName) \
+ (LCCellDataType)cellDataType {\
static LCCellDataType dataType;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
dataType = dataTypeName;\
});\
return dataType;\
}\

/** cell数据的类型 */
typedef NS_ENUM(NSInteger, LCCellDataType) {
    /** Model */
    LCCellDataTypeModel,
    /** ViewModel */
    LCCellDataTypeViewModel,
};

@protocol LCCellDataProtocol <NSObject>

@required

@property (nonatomic, assign) CGFloat cellHeight;

+ (Class)cellClass;
+ (LCCellDataType)cellDataType;

@end
