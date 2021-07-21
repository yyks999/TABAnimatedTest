//
//  LNAppListViewController.m
//  iLiaoNing
//
//  Created by 杨翊楷 on 7/14/20.
//  Copyright © 2020 YK Yang. All rights reserved.
//

#import "LNAppListViewController.h"
#import "LNAppListCollectView.h"
#import "LNAppModel.h"
#import "LNAppManager.h"

#import "TABAnimated.h"

@interface LNAppListViewController ()

@property (nonatomic, strong) LNAppListCollectView *appListCollectView;

@property (nonatomic, strong) UIView  *headerVeiw;
@property (nonatomic, strong) UILabel *headerTitleLabel;

@property (nonatomic, strong) NSArray *appArray;

@end

@implementation LNAppListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"电话小程序";
    
    [self initSubViews];
    
    // 请求数据
    ATWeak;
    [LNAppManager getCloudAppListComplete:^(NSArray *appArray) {

        if(!ATArrayIsEmpty(appArray)) {
            weakSelf.appArray = [NSArray arrayWithArray:appArray];
            [weakSelf updateMenu];

            //骨架屏动画停止
            [weakSelf.appListCollectView tab_endAnimationEaseOut];
        }
    }];
}

- (void)userLogOut {
    _appArray = @[];
    [self.appListCollectView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    //每次显示页面时，刷新数据源
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self loadAppData];
    });
}

- (void)initSubViews {
    
    [self.view addSubview:self.headerVeiw];
    [self.headerVeiw addSubview:self.headerTitleLabel];
    [self.view addSubview:self.appListCollectView];
}

- (void)loadAppData {
    
    [self updateMenu];
    
    //获取小程序菜单接口
    
    ATWeak;
    //骨架屏动画开始
    [self.appListCollectView tab_startAnimationWithCompletion:^{
        // 请求数据
        [LNAppManager getCloudAppListComplete:^(NSArray *appArray) {

            if(!ATArrayIsEmpty(appArray)) {
                weakSelf.appArray = [NSArray arrayWithArray:appArray];
                [weakSelf updateMenu];

                //骨架屏动画停止
                [weakSelf.appListCollectView tab_endAnimationEaseOut];
            }
        }];
    }];
}

- (void)updateMenu {
    
    self.appListCollectView.dataArray = _appArray;
    [self.appListCollectView reloadData];
}

#pragma mark - Lazy

- (LNAppListCollectView *)appListCollectView {
    if(!_appListCollectView) {
        
//        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 35);  //设置headerView大小
//        flowLayout.footerReferenceSize = CGSizeMake(0, 0);  // 设置footerView大小
        
        _appListCollectView = [[LNAppListCollectView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerVeiw.frame), SCREEN_WIDTH, self.view.frame.size.height - CGRectGetMaxY(_headerVeiw.frame)) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        
        ATWeak;
        _appListCollectView.appClickBlock = ^(LNAppModel *model) {
            
            weakSelf.appArray = @[];
            [weakSelf loadAppData];
        };
    }
    
    return _appListCollectView;
}

- (UIView *)headerVeiw {
    if(!_headerVeiw) {
        _headerVeiw = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 52)];
    }
    
    return _headerVeiw;
}

- (UILabel *)headerTitleLabel {
    if(!_headerTitleLabel) {
        _headerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 150) / 2, 0, 150, _headerVeiw.frame.size.height)];
        _headerTitleLabel.font = [UIFont boldSystemFontOfSize:18];
        _headerTitleLabel.textAlignment = NSTextAlignmentCenter;
        _headerTitleLabel.text = @"电话小程序";
    }
    
    return _headerTitleLabel;
}

@end
