//
//  UIView+QuartzDemo.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/7.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "UIView+QuartzDemo.h"

@implementation UIView (QuartzDemo)

- (void)drawRectWithRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextSetLineWidth(context, 6);
    
    CGContextAddRect(context, CGRectMake(10, 10, 80, 80));
    CGContextDrawPath(context, kCGPathStroke);
}

- (void)drawCircleWithRect:(CGRect)rect {
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
