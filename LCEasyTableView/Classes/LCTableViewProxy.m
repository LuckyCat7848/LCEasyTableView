//
//  LCTableViewProxy.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCTableViewProxy.h"

@implementation LCTableViewProxy

#pragma mark - forwarding methods

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([_extraDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    if ([_impDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature;
    if ([_extraDelegate respondsToSelector:aSelector]) {
        signature = [(NSObject *)_extraDelegate methodSignatureForSelector:aSelector];
        
    } else if ([_impDelegate respondsToSelector:aSelector]) {
        signature = [(NSObject *)_impDelegate methodSignatureForSelector:aSelector];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([_extraDelegate respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_extraDelegate];
        
    } else if ([_impDelegate respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:_impDelegate];
    } else {
        NSLog(@"");
    }
}

@end
