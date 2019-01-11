//
//  EHICellViewModelProtocol.h
//  Viktor
//
//  Created by WangZhaoYun on 2016/10/14.
//  Copyright © 2016年 WangZhaoYun. All rights reserved.
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

#define SetModelClass(className) \
+ (Class)modelClass {\
static Class class;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
class = LCClass(className);\
});\
return class;\
}\


@protocol EHICellViewModelProtocol <NSObject>

@optional

/** 标识类型(用于一个tableView多种Type时标识用) */
@property (nonatomic, assign) NSInteger identityType;

@required

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) id model;

+ (Class)cellClass;

@end

