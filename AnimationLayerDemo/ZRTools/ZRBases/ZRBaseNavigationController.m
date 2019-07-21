//
//  ZRBaseNavigationController.m
//  ZRTools
//
//  Created by Hesland on 2018/8/25.
//  Copyright © 2018年 ZRTools. All rights reserved.
//

#import "ZRBaseNavigationController.h"

@interface ZRBaseNavigationController ()

@end

@implementation ZRBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}


@end
