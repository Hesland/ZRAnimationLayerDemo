//
//  UIView+QuartzDemo.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/7.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "UIView+QuartzDemo.h"

@implementation UIView (QuartzDemo)

// 绘制直线
- (void)zr_drawLinesWithRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 绘制方式对比 UIBezierPath
    CGMutablePathRef mutablePath = CGPathCreateMutable();
    // 牵扯到动画的变量
//    CGAffineTransform transform =
    CGPathMoveToPoint(mutablePath, NULL, 50, 50);
    CGPathAddLineToPoint(mutablePath, NULL, 200, 200);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextAddPath(context, mutablePath);
    
    /*
     绘制接口
     */
//    CGContextStrokePath(context);
    CGContextDrawPath(context, kCGPathStroke);
    
    // path 在结束后需要释放
    CFRelease(mutablePath);
}

// 绘制多边形
- (void)zr_drawPolygonWithRect:(CGRect)rect points:(NSArray *)points {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef mutablePath = CGPathCreateMutable();
    
    __block CGPoint startPoint = CGPointMake(MAXFLOAT, MAXFLOAT);
    [points enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGPoint point = [obj CGPointValue];
        CGFloat x = point.x;
        CGFloat y = point.y;
        if (idx == 0) {
            startPoint = CGPointMake(x, y);
            CGPathMoveToPoint(mutablePath, NULL, x, y);
        } else {
            CGPathAddLineToPoint(mutablePath, NULL, x, y);
        }
    }];
    
    if (startPoint.x != MAXFLOAT && startPoint.y != MAXFLOAT) {
        CGPathAddLineToPoint(mutablePath, NULL, startPoint.x, startPoint.y);
    }
//    CGContextClosePath(context);
    
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextAddPath(context, mutablePath);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CFRelease(mutablePath);
}

// 绘制矩形
- (void)zr_drawRectWithRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextSetLineWidth(context, 6);
    
    CGContextAddRect(context, CGRectMake(10, 10, 80, 80));
    CGContextDrawPath(context, kCGPathStroke);
}

// 绘制曲线
- (void)zr_drawCircleWithRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    // 设置画笔宽度
    CGFloat lineWidth = 5;
    CGContextSetLineWidth(context, lineWidth);
    
    // 设置曲线相关属性
    CGFloat centerX = CGRectGetWidth(rect)  * 0.5;
    CGFloat centerY = CGRectGetHeight(rect) * 0.5;
    CGFloat radius = MIN(self.frame.size.width, self.frame.size.height);
    
    CGFloat cusRadius = radius * 0.5 - lineWidth * 0.5;
    double PI = 3.14159265358979323846;
    
    // 设置绘制路径
    CGContextAddArc(context, centerX, centerY, cusRadius, 0, 2 * PI, NO);
    CGContextDrawPath(context, kCGPathStroke);
}

@end
