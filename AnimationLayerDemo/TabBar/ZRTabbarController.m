//
//  ZRTabbarController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/10.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRTabbarController.h"
#import "ZRChartNavController.h"
#import "ZRChartViewController.h"
#import "ZRHistogramNavController.h"
#import "ZRHistogramViewController.h"
#import "ZRAnimationViewController.h"
#import "ZRFlutterBaseViewController.h"
#import "ZRTransViewController.h"

@implementation ZRTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZRFlutterBaseViewController *flutter = [[ZRFlutterBaseViewController alloc] init];
    
    ZRChartNavController *chartNavi = [[ZRChartNavController alloc] initWithRootViewController:[[ZRChartViewController alloc] init]];
    ZRHistogramNavController *histogramNavi = [[ZRHistogramNavController alloc] initWithRootViewController:[[ZRHistogramViewController alloc] init]];
    ZRBaseNavigationController *animationNavi = [[ZRBaseNavigationController alloc] initWithRootViewController:[[ZRAnimationViewController alloc] init]];
    
    flutter.title = @"Flutter";
    chartNavi.title = @"Chart";
    histogramNavi.title = @"Histogram";
    animationNavi.title = @"Animations";
    
    [self addChildViewController:flutter];
    [self addChildViewController:chartNavi];
    [self addChildViewController:histogramNavi];
    [self addChildViewController:animationNavi];
}


@end
