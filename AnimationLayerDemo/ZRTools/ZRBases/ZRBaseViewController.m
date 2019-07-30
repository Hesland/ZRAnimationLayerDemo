//
//  ZRBaseViewController.m
//  ZRTools
//
//  Created by Hesland on 2018/8/25.
//  Copyright © 2018年 ZRTools. All rights reserved.
//

#import "ZRBaseViewController.h"
#import "ZRBaseNavigationController.h"

@interface ZRBaseViewController ()

@end

@implementation ZRBaseViewController

#pragma mark - 生命周期

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self didInitialized];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self didInitialized];
    }
    return self;
}

/// 初始化完成后的代码调用
- (void)didInitialized {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor redColor];
}

- (void)creatleftBarButtonItem {
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_back_default" highlightImageName:@"icon_back_default" target:self action:@selector(backViewController:)];
}

- (void)backViewController:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    [MBProgressHUD DQHideHUD];
}

//- (ZRBaseNavigationController *)navigationController {
//    if ([self.navigationController isKindOfClass:[ZRBaseNavigationController class]]) {
//        return (ZRBaseNavigationController *)self.navigationController;
//    }
//    else {
//        return nil;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)description {
    NSString *description = [super description];
    return [NSString stringWithFormat:@"===description:%@\n",description];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

@end
