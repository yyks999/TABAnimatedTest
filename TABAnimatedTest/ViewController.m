//
//  ViewController.m
//  TABAnimatedTest
//
//  Created by 杨翊楷 on 7/19/21.
//

#import "ViewController.h"
#import "LNAppListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LNAppListViewController *alVC = [[LNAppListViewController alloc] init];
    [self addChildViewController:alVC];
    [self.view addSubview:alVC.view];
}


@end
