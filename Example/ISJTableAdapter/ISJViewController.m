//
//  ISJViewController.m
//  ISJTableAdapter
//
//  Created by z624821876 on 07/15/2019.
//  Copyright (c) 2019 z624821876. All rights reserved.
//

#import "ISJViewController.h"
#import <ISJTableAdapter/ISJTableAdapter.h>

@interface ISJTableViewCell : UITableViewCell<ISJTableAdapterCellDelegate>

@property (nonatomic, strong) id<ISJTableAdapterViewModelDelegate> adapterViewModel;

@end

@implementation ISJTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    self.contentView.backgroundColor = [UIColor redColor];
}

- (void)setAdapterViewModel:(id<ISJTableAdapterViewModelDelegate>)adapterViewModel {
    _adapterViewModel = adapterViewModel;
    
}

@end

@interface ISJTableCellViewModel : NSObject<ISJTableAdapterViewModelDelegate>

@property (nonatomic, copy) void(^didSelectBlock)(UITableView *tableView, NSIndexPath *indexPath);

@property (nonatomic, copy) NSString    *title;
@property (nonatomic, copy) NSString    *subTitle;

@end

@implementation ISJTableCellViewModel

/** 行高 */
- (CGFloat)height {
    return 50.f;
}

/** 自适应估算高度 */
- (CGFloat)estimatedHeight {
    return 0;
}

/** 是否自适应行高 */
- (BOOL)automaticDimension {
    return NO;
}

/** 要创建的Cell/Header 类名 */
- (NSString *)className {
    return NSStringFromClass([ISJTableViewCell class]);
}

@end

@interface ISJViewController ()

@property (nonatomic, strong) ISJTableAdapter   *adapter;

@end

@implementation ISJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self.adapter;
    tableView.dataSource = self.adapter;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];

    [tableView registerClass:[ISJTableViewCell class] forCellReuseIdentifier:@"ISJTableViewCell"];
    [self.view addSubview:tableView];
}

- (void)loadRequest {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray *array = [NSMutableArray array];
        NSMutableArray *rows = [NSMutableArray array];
        ISJTableAdapterModel *section0 = [ISJTableAdapterModel new];
        [array addObject:section0];
        [rows removeAllObjects];
        {
            ISJTableCellViewModel *row0 = [ISJTableCellViewModel new];
            row0.title = @"账号与安全";
            row0.didSelectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"%@----%@", tableView, indexPath);
            };
            [rows addObject:row0];
            
            ISJTableCellViewModel *row1 = [ISJTableCellViewModel new];
            row1.title = @"我的收获地址";
            row1.didSelectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"%@----%@", tableView, indexPath);
            };
            [rows addObject:row1];
            section0.dataSource = [rows copy];
        }
        
        ISJTableAdapterModel *section1 = [ISJTableAdapterModel new];
        [array addObject:section1];
        [rows removeAllObjects];
        {
            ISJTableCellViewModel *row0 = [ISJTableCellViewModel new];
            row0.title = @"扫一扫";
            row0.didSelectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"%@----%@", tableView, indexPath);
            };
            [rows addObject:row0];
            
            ISJTableCellViewModel *row1 = [ISJTableCellViewModel new];
            row1.title = @"清空缓存";
            row1.didSelectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"%@----%@", tableView, indexPath);
            };
            [rows addObject:row1];
            
            ISJTableCellViewModel *row2 = [ISJTableCellViewModel new];
            row2.title = @"意见反馈";
            row2.didSelectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"%@----%@", tableView, indexPath);
            };
            [rows addObject:row2];
            
            ISJTableCellViewModel *row3 = [ISJTableCellViewModel new];
            row3.title = @"隐私协议";
            row3.didSelectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"%@----%@", tableView, indexPath);
            };
            [rows addObject:row3];
            section1.dataSource = [rows copy];
        }
        
        ISJTableAdapterModel *section2 = [ISJTableAdapterModel new];
        [array addObject:section2];
        [rows removeAllObjects];
        {
            ISJTableCellViewModel *row0 = [ISJTableCellViewModel new];
            row0.title = @"版本号";
            row0.didSelectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"%@----%@", tableView, indexPath);
            };
            [rows addObject:row0];
            
            ISJTableCellViewModel *row1 = [ISJTableCellViewModel new];
            row1.title = @"爱上街平台服务协议";
            row1.didSelectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"%@----%@", tableView, indexPath);
            };
            [rows addObject:row1];
            section2.dataSource = [rows copy];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.adapter.dataSource = [array copy];
        });
    });
}

- (ISJTableAdapter *)adapter {
    if (!_adapter) {

        self.adapter = [[ISJTableAdapter alloc] init];
        self.adapter.delegate = self;
    }
    return _adapter;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
