//
//  ZRChartViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/10.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRChartView.h"
#import "ZRChartViewController.h"

@interface ZRChartViewController ()<ZRChartViewDataSource>

@property (nonatomic, strong) ZRChartView *chartView;


@end

@implementation ZRChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Chart";
    
    self.chartView = [[ZRChartView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 100)];
    
    [self.view addSubview:self.chartView];
    
    self.chartView.dataSource = self;
}

#pragma mark - ZRChartViewDataSource

- (NSInteger)numberOfPointsInChart {
    return 1;
}

- (CGPoint)chartView:(ZRChartView *)chartView atIndex:(NSIndexPath *)indexPath {
    return CGPointMake(0, 0);
}

@end
