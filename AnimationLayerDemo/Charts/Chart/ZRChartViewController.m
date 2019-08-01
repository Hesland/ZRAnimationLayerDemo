//
//  ZRChartViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/10.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRChartView.h"
#import "ZRChartViewController.h"

#define ZRChartDataCount 100

@interface ZRChartViewController ()<ZRChartViewDataSource>

@property (nonatomic, strong) ZRChartView *chartView;
@property (nonatomic, copy) NSArray<NSNumber *> *data;


@end

@implementation ZRChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Chart";
    
    self.chartView = [[ZRChartView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 100)];
    
    [self.view addSubview:self.chartView];
    
    NSMutableArray *data_tmp = [NSMutableArray arrayWithCapacity:ZRChartDataCount];
    for (NSInteger i = 0; i < ZRChartDataCount; i ++) {
         double value = (double)arc4random_uniform(599);
        [data_tmp addObject:@(value - 300.0)];
    }
    self.data = [data_tmp copy];
    self.chartView.dataSource = self;
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.chartView setNeedsDisplay];
//    });
}

#pragma mark - ZRChartViewDataSource

- (NSInteger)numberOfPointsInChart {
    return ZRChartDataCount;
}

- (double)chartView:(ZRChartView *)chartView valueAtIndex:(NSIndexPath *)indexPath {
    return [self.data[indexPath.row] doubleValue];
}

@end
