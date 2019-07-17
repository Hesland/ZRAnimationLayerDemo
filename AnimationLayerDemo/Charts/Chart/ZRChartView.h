//
//  ZRChartView.h
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/10.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZRChartView;

@protocol ZRChartViewDataSource <NSObject>

- (NSInteger)numberOfPointsInChart;

- (CGPoint)chartView:(ZRChartView *)chartView atIndex:(NSIndexPath *)indexPath;

@end

@interface ZRChartView : UIView

@property (nonatomic, assign) CGFloat h_center;
@property (nonatomic, assign) CGFloat v_center;

@property (nonatomic, weak) id<ZRChartViewDataSource> dataSource;


@end



NS_ASSUME_NONNULL_END
