//
//  LCTableViewIMP.m
//  LCTableView_Example
//
//  Created by LuckyCat on 2019/1/14.
//  Copyright © 2019年 LuckyCat7848. All rights reserved.
//

#import "LCTableViewIMP.h"

@interface LCTableViewIMP () 
@end

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
//    if ([self.delegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
//        return [self.delegate tableView:self heightForHeaderInSection:section];
//    }
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    if ([self.delegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)]) {
//        return [self.delegate tableView:self viewForHeaderInSection:section];
//    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    if ([self.delegate respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
//        return [self.delegate tableView:self heightForFooterInSection:section];
//    }
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    if ([self.delegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
//        return [self.delegate tableView:self viewForFooterInSection:section];
//    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([self.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
//        return [self.delegate tableView:self heightForRowAtIndexPath:indexPath];
//    }
    
    // MVVM
    id object = [self cellViewModelWithIndexPath:indexPath];
    if ([object conformsToProtocol:@protocol(EHICellViewModelProtocol)]) {
        id<EHICellViewModelProtocol> cellViewModel = object;
        return cellViewModel.cellHeight;
    }
    
    // Normal
//    if ([self.delegate respondsToSelector:@selector(tableView:cellClassForRowAtIndexPath:)]) {
//        return tableView.rowHeight;
//    }
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cellClass = [UITableViewCell class];
    // 获取cellClass
    id object = [self cellViewModelWithIndexPath:indexPath];
    if ([object conformsToProtocol:@protocol(EHICellViewModelProtocol)]) {
        // MVVM
        id<EHICellViewModelProtocol> cellViewModel = object;
        cellClass = [cellViewModel.class cellClass];
        
//    } else if ([self.delegate respondsToSelector:@selector(tableView:cellClassForRowAtIndexPath:)]) {
//        // Normal
//        cellClass = [self.delegate tableView:self cellClassForRowAtIndexPath:indexPath];
    }
    
    // 获取cell
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
    if ([object conformsToProtocol:@protocol(EHICellViewModelProtocol)] && [cell respondsToSelector:@selector(setViewModel:)]) {
        // 赋值：EHICellViewModel
        [cell performSelector:@selector(setViewModel:) withObject:object];
        
    } else if ([cell respondsToSelector:@selector(setModel:)]) {
        // 赋值：Model
        [cell performSelector:@selector(setModel:) withObject:object];
    }
    // 赋值后特殊处理
//    if ([self.delegate respondsToSelector:@selector(tableView:cellForRowAtIndexPath:tableViewCell:viewModel:)]) {
//        [self.delegate tableView:self cellForRowAtIndexPath:indexPath tableViewCell:cell viewModel:object];
//    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    for (id target in self.proxy.targets) {
//        if (target == self) {
//            continue;
//        }
//        if ([target respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
//            [target tableView:tableView didSelectRowAtIndexPath:indexPath];
//        }
//    }
}

#pragma mark - Method

/** 根据数据类型和位置取数据 */
- (id<EHICellViewModelProtocol>)cellViewModelWithIndexPath:(NSIndexPath *)indexPath {
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
