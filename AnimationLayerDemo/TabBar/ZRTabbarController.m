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

@implementation ZRTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZRChartNavController *chartNavi = [[ZRChartNavController alloc] initWithRootViewController:[[ZRChartViewController alloc] init]];
    ZRHistogramNavController *histogramNavi = [[ZRHistogramNavController alloc] initWithRootViewController:[[ZRHistogramViewController alloc] init]];
    
    ZRBaseNavigationController *animationNavi = [[ZRBaseNavigationController alloc] initWithRootViewController:[[ZRAnimationViewController alloc] init]];
    
    chartNavi.title = @"chart";
    histogramNavi.title = @"histogram";
    animationNavi.title = @"animations";
    
    [self addChildViewController:chartNavi];
    [self addChildViewController:histogramNavi];
    [self addChildViewController:animationNavi];
}


@end
