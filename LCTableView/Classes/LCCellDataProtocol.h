//
//  LCCellDataProtocol.h
//  LCTableView
//
//  Created by LuckyCat on 2019/1/15.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
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

//#define SetCellDataType(dataTypeName) \
//+ (Class)cellDataType {\
//static LCCellDataType dataType;\
//static dispatch_once_t onceToken;\
//dispatch_once(&onceToken, ^{\
//dataType = dataTypeName;\
//});\
//return class;\
//}\

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

@optional
/** cell数据类型(默认使用Model) */
+ (LCCellDataType)cellDataType;

@end
