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

@end

@implementation ISJTableCellViewModel

/** 行高 */
- (CGFloat)height {
    return 60;
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
    
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *rows = [NSMutableArray array];
    for (int i = 0; i < 10; i ++) {
        ISJTableAdapterModel *model = [ISJTableAdapterModel new];
        [rows removeAllObjects];
        for (int j = 0; j < 10; j ++) {
            ISJTableCellViewModel *viewModel = [ISJTableCellViewModel new];
            viewModel.didSelectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"%@----%@", tableView, indexPath);
            };
            [rows addObject:viewModel];
        }
        model.dataSource = [rows copy];
        [array addObject:model];
    }
    
    self.adapter = [[ISJTableAdapter alloc] init];
    self.adapter.dataSource = [array copy];
    self.adapter.delegate = self;
    
    NSMutableArray *array1 = [NSMutableArray array];
    [array1 addObject:NSStringFromSelector(@selector(scrollViewDidScroll:))];
    self.adapter.extensionMethods = [array1 copy];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self.adapter;
    tableView.dataSource = self.adapter;
    [tableView registerClass:[ISJTableViewCell class] forCellReuseIdentifier:@"ISJTableViewCell"];
    [self.view addSubview:tableView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"-------");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectRowAtIndexPath");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
