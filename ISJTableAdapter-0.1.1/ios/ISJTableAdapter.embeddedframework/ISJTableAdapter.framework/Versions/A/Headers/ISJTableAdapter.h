//
//  ISJTableAdapter.h
//  Pods-ISJTableAdapter_Example
//
//  Created by yu on 2019/7/15.
//
//  TableView 适配器 内部默认实现的方法
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
//- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath;
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section;
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section;
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ISJTableAdapterDelegate.h"
#import "ISJTableAdapterModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ISJTableAdapterModel;

@interface ISJTableAdapter : NSObject<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray<ISJTableAdapterModel *>   *dataSource;

@property (nonatomic, weak) id   delegate;

/** 需要delegate接收的tableView代理方法
    适配器内部只实现了常用的数据源方法
    如果要实现其他方法，需要外部delegate实现，并将SEL->NSString 放入extensionMethods中
 */
@property (nonatomic, copy) NSArray<NSString *>    *extensionMethods;

@end

NS_ASSUME_NONNULL_END
