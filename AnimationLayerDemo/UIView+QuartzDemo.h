//
//  UIView+QuartzDemo.h
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/7.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (QuartzDemo)

- (void)zr_drawLinesWithRect:(CGRect)rect;
- (void)zr_drawRectWithRect:(CGRect)rect;
- (void)zr_drawCircleWithRect:(CGRect)rect;
- (void)zr_drawPolygonWithRect:(CGRect)rect points:(NSArray *)points;


// Histogram:直方图

@end

NS_ASSUME_NONNULL_END
