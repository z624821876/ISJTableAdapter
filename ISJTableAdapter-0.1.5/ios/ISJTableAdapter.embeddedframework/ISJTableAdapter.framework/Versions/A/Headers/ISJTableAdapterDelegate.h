//
//  ISJTableAdapterDelegate.h
//  ISJTableAdapter
//
//  Created by yu on 2019/7/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ISJTableAdapterViewModelDelegate <NSObject>

/** 行高 */
- (CGFloat)height;

/** 要创建的Cell/Header 类名 */
- (NSString *)className;

/** 自适应估算高度 */
- (CGFloat)estimatedHeight;

/** 是否自适应行高 */
- (BOOL)automaticDimension;

@optional
@property (nonatomic, copy) void(^didSelectBlock)(UITableView *tableView, NSIndexPath *indexPath);

@end

@protocol ISJTableAdapterCellDelegate <NSObject>

@property (nonatomic, strong) id<ISJTableAdapterViewModelDelegate> adapterViewModel;

@end

@protocol ISJTableAdapterDelegate <NSObject>

@optional
- (UITableViewCell *)tableView:(UITableView *)tableView cellModel:(id<ISJTableAdapterViewModelDelegate>)cellModel cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (nullable UIView *)tableView:(UITableView *)tableView cellModel:(id<ISJTableAdapterViewModelDelegate>)cellModel viewForHeaderInSection:(NSInteger)section;

- (nullable UIView *)tableView:(UITableView *)tableView cellModel:(id<ISJTableAdapterViewModelDelegate>)cellModel viewForFooterInSection:(NSInteger)section;

@end


NS_ASSUME_NONNULL_END
