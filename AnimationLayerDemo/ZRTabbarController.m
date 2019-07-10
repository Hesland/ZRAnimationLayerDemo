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

@implementation ZRTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZRChartNavController *chartNavi = [[ZRChartNavController alloc] initWithRootViewController:[[ZRChartViewController alloc] init]];
    ZRHistogramNavController *histogramNavi = [[ZRHistogramNavController alloc] initWithRootViewController:[[ZRHistogramViewController alloc] init]];
    
    chartNavi.title = @"chart";
    histogramNavi.title = @"histogram";
    
    [self addChildViewController:chartNavi];
    [self addChildViewController:histogramNavi];
}


@end
