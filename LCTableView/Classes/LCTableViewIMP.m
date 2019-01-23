//
//  LCTableViewIMP.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCTableViewIMP.h"

@implementation LCTableViewIMP

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.dataArray.count && [self.dataArray[0] isKindOfClass:[NSArray class]]) {
        return self.dataArray.count;
    }
    if (self.isSectionsStyle) {
        return self.dataArray.count;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.dataArray.count && [self.dataArray[0] isKindOfClass:[NSArray class]]) {
        return [self.dataArray[section] count];
    }
    if (self.isSectionsStyle) {
        return 1;
    }
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = [self cellViewModelWithIndexPath:indexPath];
    if ([object conformsToProtocol:@protocol(LCCellDataProtocol)]) {
        id<LCCellDataProtocol> data = object;
        return data.cellHeight;
    }
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cellClass = [UITableViewCell class];
    // TODO：获取cellClass
    id object = [self cellViewModelWithIndexPath:indexPath];
    if ([object conformsToProtocol:@protocol(LCCellDataProtocol)]) {
        id<LCCellDataProtocol> data = object;
        cellClass = [data.class cellClass];
    }
    
    // TODO：获取cell
    NSString *identifier = NSStringFromClass(cellClass);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSString *nibPath = [[NSBundle mainBundle] pathForResource:identifier ofType:@"nib"];
        if (nibPath) {
            cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] objectAtIndex:0];
        } else {
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = [self cellViewModelWithIndexPath:indexPath];
    // TODO：赋值
    if ([object conformsToProtocol:@protocol(LCCellDataProtocol)]) {
        if ([cell respondsToSelector:@selector(setModel:)]) {
            [cell performSelector:@selector(setModel:) withObject:object];
        
        } else if ([cell respondsToSelector:@selector(setViewModel:)]) {
            [cell performSelector:@selector(setViewModel:) withObject:object];
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Method

/** 根据数据类型和位置取数据 */
- (id<LCCellDataProtocol>)cellViewModelWithIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count && [self.dataArray[0] isKindOfClass:[NSArray class]]) {
        return self.dataArray[indexPath.section][indexPath.row];
    }
    if (self.isSectionsStyle) {
        return self.dataArray[indexPath.section];
    }
    return self.dataArray[indexPath.row];
}

@end
