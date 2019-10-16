//
//  ISJTableAdapterModel.h
//  ISJTableAdapter
//
//  Created by yu on 2019/7/15.
//

#import <Foundation/Foundation.h>

#import "ISJTableAdapterDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ISJTableAdapterModel : NSObject

@property (nonatomic, copy) NSArray<id<ISJTableAdapterViewModelDelegate>>   *dataSource;

@property (nonatomic, strong) id<ISJTableAdapterViewModelDelegate>  headerModel;

@property (nonatomic, strong) id<ISJTableAdapterViewModelDelegate>  footerModel;

@end

NS_ASSUME_NONNULL_END
