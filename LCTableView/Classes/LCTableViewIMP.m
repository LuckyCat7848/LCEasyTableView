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
    switch (self.dataStyle) {
        case EHITableViewDataStyleRows:
            return 1;
            break;
        case EHITableViewDataStyleSections:
            return self.dataArray.count;
            break;
        case EHITableViewDataStyleAll:
            return self.dataArray.count;
            break;
        default:
            break;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (self.dataStyle) {
        case EHITableViewDataStyleRows:
            return self.dataArray.count;
            break;
        case EHITableViewDataStyleSections:
            return 1;
            break;
        case EHITableViewDataStyleAll:
            return [self.dataArray[section] count];
            break;
        default:
            break;
    }
    return 0;
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
    if (cell == nil) {
        NSString *nibPath = [[NSBundle mainBundle] pathForResource:identifier ofType:@"nib"];
        if (nibPath) {
            cell = [[[NSBundle mainBundle] loadNibNamed:identifier owner:self options:nil] objectAtIndex:0];
        } else {
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
    }
    // TODO：赋值
    if ([object conformsToProtocol:@protocol(LCCellDataProtocol)]) {
        id<LCCellDataProtocol> data = object;
        LCCellDataType type = 0;
        if ([data.class respondsToSelector:@selector(cellDataType)]) {
            type = [data.class cellDataType];
        }
        if (type == LCCellDataTypeModel && [cell respondsToSelector:@selector(setModel:)]) {
            [cell performSelector:@selector(setModel:) withObject:object];
        
        } else if (type == LCCellDataTypeViewModel && [cell respondsToSelector:@selector(setViewModel:)]) {
            [cell performSelector:@selector(setViewModel:) withObject:object];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Method

/** 根据数据类型和位置取数据 */
- (id<LCCellDataProtocol>)cellViewModelWithIndexPath:(NSIndexPath *)indexPath {
    switch (self.dataStyle) {
        case EHITableViewDataStyleRows:
            return self.dataArray[indexPath.row];
            break;
        case EHITableViewDataStyleSections:
            return self.dataArray[indexPath.section];
            break;
        case EHITableViewDataStyleAll:
            return self.dataArray[indexPath.section][indexPath.row];
            break;
        default:
            break;
    }
    return nil;
}

@end
