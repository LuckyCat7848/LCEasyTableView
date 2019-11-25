//
//  UITableView+LCAdd.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "UITableView+LCAdd.h"
#import <objc/runtime.h>
#import "LCTableViewProxy.h"
#import "LCTableViewIMP.h"

static const void *kLCTableViewProxy = &kLCTableViewProxy;
static const void *kLCTableViewIMP = &kLCTableViewIMP;

static const void *kLCTableViewDelegate = &kLCTableViewDelegate;
static const void *kLCTableViewDataArray = &kLCTableViewDataArray;
static const void *kLCTableViewIsSectionsStyle = &kLCTableViewIsSectionsStyle;

@interface UITableView ()

@property (nonatomic, strong) LCTableViewProxy *proxy;
@property (nonatomic, strong) LCTableViewIMP *imp;

@end

@implementation UITableView (LCAdd)

#pragma mark - public

- (void)setLc_Delegate:(id<UITableViewDelegate,UITableViewDataSource>)lc_Delegate {
    objc_setAssociatedObject(self, kLCTableViewDelegate, lc_Delegate, OBJC_ASSOCIATION_ASSIGN);
    self.proxy.extraDelegate = lc_Delegate;
}

- (id<UITableViewDelegate, UITableViewDataSource>)lc_Delegate {
    return objc_getAssociatedObject(self, kLCTableViewDelegate);
}

#pragma mark - data

- (void)setLc_isSectionsStyle:(BOOL)lc_isSectionsStyle {
    objc_setAssociatedObject(self, kLCTableViewIsSectionsStyle, @(lc_isSectionsStyle), OBJC_ASSOCIATION_ASSIGN);
    self.imp.isSectionsStyle = lc_isSectionsStyle;
}

- (BOOL)lc_isSectionsStyle {
    return [objc_getAssociatedObject(self, kLCTableViewIsSectionsStyle) integerValue];
}

- (void)setLc_dataArray:(NSMutableArray *)lc_dataArray {
    objc_setAssociatedObject(self, kLCTableViewDataArray, lc_dataArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)lc_dataArray {
    NSMutableArray *array = objc_getAssociatedObject(self, kLCTableViewDataArray);
    if (!array) {
        array = [NSMutableArray array];
        self.lc_dataArray = array;
        self.imp.dataArray = array;
        
        self.proxy.impDelegate = self.imp;
        self.delegate = (id<UITableViewDelegate>)self.proxy;
        self.dataSource = (id<UITableViewDataSource>)self.proxy;
    }
    return array;
}

#pragma mark - private

- (void)setProxy:(LCTableViewProxy *)proxy {
    objc_setAssociatedObject(self, kLCTableViewProxy, proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (LCTableViewProxy *)proxy {
    LCTableViewProxy *proxy = objc_getAssociatedObject(self, kLCTableViewProxy);
    if (!proxy) {
        proxy = [LCTableViewProxy alloc];
        self.proxy = proxy;
    }
    return proxy;
}

- (void)setImp:(LCTableViewIMP *)imp {
    objc_setAssociatedObject(self, kLCTableViewIMP, imp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (LCTableViewIMP *)imp {
    LCTableViewIMP *imp = objc_getAssociatedObject(self, kLCTableViewIMP);
    if (!imp) {
        imp = [[LCTableViewIMP alloc] init];
        self.imp = imp;
    }
    return imp;
}

@end
