//
//  ISJTableAdapter.m
//  Pods-ISJTableAdapter_Example
//
//  Created by yu on 2019/7/15.
//

#import "ISJTableAdapter.h"

@implementation ISJTableAdapter

- (BOOL)respondsToSelector:(SEL)aSelector {
    NSString *selString = NSStringFromSelector(aSelector);
    if (self.delegate && [self.extensionMethods containsObject:selString] && [self.delegate respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.delegate;
}

#pragma mark - TableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ISJTableAdapterModel *model = _dataSource[section];
    return model.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ISJTableAdapterModel *model = _dataSource[indexPath.section];
    id<ISJTableAdapterViewModelDelegate> cellModel = model.dataSource[indexPath.row];
    if (cellModel.className) {
        UITableViewCell<ISJTableAdapterCellDelegate> *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.className];
        if ([cell respondsToSelector:@selector(setAdapterViewModel:)]) {
            cell.adapterViewModel = cellModel;
        }
        return cell;
    }else if ([self.delegate respondsToSelector:@selector(tableView:cellModel:cellForRowAtIndexPath:)]) {
        return [self.delegate tableView:tableView cellModel:cellModel cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ISJTableAdapterModel *model = _dataSource[indexPath.section];
    id<ISJTableAdapterViewModelDelegate> cellModel = model.dataSource[indexPath.row];
    return cellModel.height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ISJTableAdapterModel *model = _dataSource[indexPath.section];
    id<ISJTableAdapterViewModelDelegate> cellModel = model.dataSource[indexPath.row];
    return cellModel.estimatedHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    ISJTableAdapterModel *model = _dataSource[section];
    if (!model.headerModel) return CGFLOAT_MIN;
    id<ISJTableAdapterViewModelDelegate> cellModel = model.headerModel;
    return cellModel.height;
}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
//    ISJTableAdapterModel *model = _dataSource[section];
//    if (!model.headerModel) return 0;
//    id<ISJTableAdapterViewModelDelegate> cellModel = model.headerModel;
//    return cellModel.estimatedHeight;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    ISJTableAdapterModel *model = _dataSource[section];
    if (!model.footerModel) return CGFLOAT_MIN;
    id<ISJTableAdapterViewModelDelegate> cellModel = model.footerModel;
    return cellModel.height;
}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
//    ISJTableAdapterModel *model = _dataSource[section];
//    if (!model.footerModel) return 0;
//    id<ISJTableAdapterViewModelDelegate> cellModel = model.footerModel;
//    return cellModel.estimatedHeight;
//}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section  {
    ISJTableAdapterModel *model = _dataSource[section];
    if (!model.headerModel) return nil;
    id<ISJTableAdapterViewModelDelegate> cellModel = model.headerModel;
    if (cellModel.className) {
        UITableViewHeaderFooterView<ISJTableAdapterCellDelegate> *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellModel.className];
        if ([cell respondsToSelector:@selector(setAdapterViewModel:)]) {
            cell.adapterViewModel = cellModel;
        }
        return cell;
    }else if ([self.delegate respondsToSelector:@selector(tableView:cellModel:viewForHeaderInSection:)]) {
        return [self.delegate tableView:tableView cellModel:cellModel viewForHeaderInSection:section];
    }
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    ISJTableAdapterModel *model = _dataSource[section];
    if (!model.footerModel) return nil;
    id<ISJTableAdapterViewModelDelegate> cellModel = model.footerModel;
    if (cellModel.className) {
        UITableViewHeaderFooterView<ISJTableAdapterCellDelegate> *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellModel.className];
        if ([cell respondsToSelector:@selector(setAdapterViewModel:)]) {
            cell.adapterViewModel = cellModel;
        }
        return cell;
    }else if ([self.delegate respondsToSelector:@selector(tableView:cellModel:viewForFooterInSection:)]) {
        return [self.delegate tableView:tableView cellModel:cellModel viewForFooterInSection:section];
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ISJTableAdapterModel *model = _dataSource[indexPath.section];
    id<ISJTableAdapterViewModelDelegate> cellModel = model.dataSource[indexPath.row];
    if ([cellModel respondsToSelector:@selector(didSelectBlock)] && cellModel.didSelectBlock) {
        cellModel.didSelectBlock(tableView, indexPath);
    }
}

#pragma mark - TableView Delegate


@end
