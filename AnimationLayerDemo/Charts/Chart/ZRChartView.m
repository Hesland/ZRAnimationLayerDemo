//
//  ZRChartView.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/10.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRChartView.h"
#import "UIView+QuartzDemo.h"

#define DefaultColor [UIColor blackColor]

@interface ZRChartView()

@property (nonatomic, strong) NSArray *points;

@end

@implementation ZRChartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.h_center = frame.size.width * 0.5;
        self.v_center = frame.size.height * 0.5;
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 布置坐标线
    [self zr_drawMedianLineWithRect:rect];
}

- (void)zr_drawMedianLineWithRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef mutablePath = CGPathCreateMutable();
    
    CGContextSetStrokeColorWithColor(context, DefaultColor.CGColor);
    
    /*
     typedef CF_ENUM(int32_t, CGLineCap) {
     kCGLineCapButt,
     kCGLineCapRound,
     kCGLineCapSquare
     };
     */
    
    CGFloat segmentLength = 5;
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGFloat lengths[] = {segmentLength, segmentLength};
    CGContextSetLineDash(context, segmentLength * 0.5, lengths, 2);
    if (self.h_center) {
        CGPathMoveToPoint(mutablePath, NULL, self.h_center, 0);
        CGPathAddLineToPoint(mutablePath, NULL, self.h_center, rect.size.height);
    }
    
    if (self.v_center) {
        CGPathMoveToPoint(mutablePath, NULL, 0, self.v_center);
        CGPathAddLineToPoint(mutablePath, NULL, rect.size.width, self.v_center);
    }
    
    CGContextAddPath(context, mutablePath);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CFRelease(mutablePath);
    
//    NSInteger pointsCount = 0;
//
//    if ([self.dataSource respondsToSelector:@selector(numberOfPointsInChart)]) {
//        pointsCount = [self.dataSource numberOfPointsInChart];
//    }
//
//    if (pointsCount > 0) {
//        for (NSInteger index = 0; index < pointsCount; index++) {
//            CGPoint point;
//            if ([self.dataSource respondsToSelector:@selector(chartView:atIndex:)]) {
//                NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:index];
//                point = [self.dataSource chartView:self atIndex:indexPath];
//
//                CGFloat x = point.x;
//                CGFloat y = point.y;
//
//                if (index == 0) {
//                    CGPathMoveToPoint(mutablePath, NULL, x, y);
//                } else {
//                    CGPathAddLineToPoint(mutablePath, NULL, x, y);
//                }
//            }
//        }
//    }
//
//    CGContextSetStrokeColorWithColor(context, DefaultColor.CGColor);
//
//    CGContextAddPath(context, mutablePath);
//    CGContextDrawPath(context, kCGPathFillStroke);
//
//    CFRelease(mutablePath);
    
    
}

// chart: 走势图
- (void)zr_drawChartWithRect:(CGRect)rect {
    if (self.points.count) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGMutablePathRef mutablePath = CGPathCreateMutable();
        
        NSInteger pointsCount = 0;
        
        if ([self.dataSource respondsToSelector:@selector(numberOfPointsInChart)]) {
            pointsCount = [self.dataSource numberOfPointsInChart];
        }
        
        if (pointsCount > 0) {
            for (NSInteger index = 0; index < pointsCount; index++) {
                CGPoint point;
                if ([self.dataSource respondsToSelector:@selector(chartView:atIndex:)]) {
                    NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:index];
                    point = [self.dataSource chartView:self atIndex:indexPath];
                    
                    CGFloat x = point.x;
                    CGFloat y = point.y;
                    
                    if (index == 0) {
                        CGPathMoveToPoint(mutablePath, NULL, x, y);
                    } else {
                        CGPathAddLineToPoint(mutablePath, NULL, x, y);
                    }
                }
            }
        }
        
        CGContextSetStrokeColorWithColor(context, DefaultColor.CGColor);
        
        CGContextAddPath(context, mutablePath);
        CGContextDrawPath(context, kCGPathFillStroke);
        
        CFRelease(mutablePath);
    }
}


@end
