//
//  ZRValueDistributionMapViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/22.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRValueDistributionMapViewController.h"

// CAAnimation 动画延时
#define ZRAnimationDuration 2

// UIBezierPath 的线宽
#define ZRDefaultLineWidth  1.5

// 多边形边数
#define ZRSidesNumber    8
// 多边形层次数
#define ZRPartsNumber   4

#define ZRFullWidth         200     // default layer width
#define ZRHalfWidth         100     // 0.5 * ZRFullWidth
#define ZRQuarterWidth      50      // 0.25 * ZRFullWidth

#define ZRFullHeight        ZRFullWidth * sqrt(3.0) * 0.5
#define ZRHalfHeight        ZRHalfWidth * sqrt(3.0) * 0.5

// 定义半径
#define ZRRadius            ZRHalfWidth

/*====== color ======*/
#define ZRDistributionLineColor       [UIColor whiteColor].CGColor
#define ZRDistributionBackgroundColor [UIColor clearColor].CGColor
#define ZRDistributionFillColor       [UIColor yellowColor].CGColor

#define ANGLE_COS(Angle) cos(M_PI / 180 * (Angle))
#define ANGLE_SIN(Angle) sin(M_PI / 180 * (Angle))

/*
 static CGPoint pointMake() {
 return CGPointMake(ZRQuarterWidth, ZRHalfWidth - ZRHalfHeight);
 }
 */

@interface ZRValueDistributionMapViewController ()

@property (nonatomic, strong) CAShapeLayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *valueLayer;


@end

@implementation ZRValueDistributionMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"distribution map demo";
    
    [self createDistributionBackground];
    [self createDistributionValueLayer];
    
    [self addScaleAnimationWithLayer:self.valueLayer];
}

- (void)createDistributionValueLayer {
    CGRect rect = (CGRect) {{0, 0}, {ZRFullWidth, ZRFullWidth}};
    self.valueLayer = [[CAShapeLayer alloc] init];
    self.valueLayer.frame = rect;
    self.valueLayer.backgroundColor = ZRDistributionBackgroundColor;
    self.valueLayer.strokeColor = ZRDistributionFillColor;
    self.valueLayer.fillColor = ZRDistributionFillColor;
    self.valueLayer.position = self.view.center;
    __block UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = ZRDefaultLineWidth;
    
    [self.view.layer addSublayer:self.valueLayer];
    
    NSArray *valuePoints = [self getPointsWithValues:@[@0.1,
                                                       @0.3,
                                                       @0.2,
                                                       @0.5,
                                                       @0.9,
                                                       @0.8,
                                                       @0.8,
                                                       @0.5]];
    
    [valuePoints enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGPoint point = obj.CGPointValue;
        
        if (idx == 0) {
            [path moveToPoint:point];
        } else {
            [path addLineToPoint:point];
        }
        
        // 为每个点加圈
    }];
    
    [path closePath];
    
    self.valueLayer.path = path.CGPath;
    
    [path removeAllPoints];
}

- (void)createDistributionBackground {
    /*
     1.分层绘制
     2.绘制网格线
     */
    
    CGRect rect = (CGRect) {{0, 0}, {ZRFullWidth, ZRFullWidth}};
    self.backgroundLayer = [[CAShapeLayer alloc] init];
    self.backgroundLayer.frame = rect;
    self.backgroundLayer.backgroundColor = ZRDistributionBackgroundColor;
    self.backgroundLayer.strokeColor = ZRDistributionLineColor;
    self.backgroundLayer.position = self.view.center;
    __block UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = ZRDefaultLineWidth;
    
    [self.view.layer addSublayer:self.backgroundLayer];
    
    NSArray *pointGroups = [self getPointsWithRadius:ZRRadius sideNum:ZRSidesNumber parts:ZRPartsNumber];
    
    // 分层绘制
    [pointGroups enumerateObjectsUsingBlock:^(NSArray<NSValue *> * _Nonnull points, NSUInteger groupIndex, BOOL * _Nonnull stop) {
        [points enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGPoint point = obj.CGPointValue;
            
            if (idx == 0) {
                [path moveToPoint:point];
            } else {
                [path addLineToPoint:point];
            }
            
        }];
        
        [path closePath];
        
        if (groupIndex == pointGroups.count - 1) {
            // 绘制网格线
            CGFloat pattern[] = {15, 10};
            [path setLineDash:pattern count:2 phase:0];

            for (NSValue *point in points) {
                [path moveToPoint:CGPointMake(ZRRadius, ZRRadius)];
                [path addLineToPoint:point.CGPointValue];
            }
        }
        
    }];
    
    self.backgroundLayer.path = path.CGPath;
    
    [path removeAllPoints];
}

- (NSArray<NSValue *> *)getPointsWithValues:(NSArray<NSNumber *> *)values {
    NSMutableArray *valuePoints = [NSMutableArray arrayWithCapacity:values.count];
    
    
    for (int i = 0; i < values.count; i++) {
        double value = values[i].doubleValue;
        // 点坐标的获取应当是基于中心点减去相应的XY向的三角函数比例值
        // 顺时针获取值
        CGFloat pointX = ZRHalfWidth - ANGLE_COS(90.0 + 360.0 / ZRSidesNumber * i) * ZRRadius * value;
        CGFloat pointY = ZRHalfWidth - ANGLE_SIN(90.0 + 360.0 / ZRSidesNumber * i) * ZRRadius * value;
        [valuePoints addObject:[NSValue valueWithCGPoint:CGPointMake(pointX, pointY)]];
    }
    
    return [valuePoints copy];
}

- (NSArray<NSValue *> *)getPointsWithRadius:(CGFloat)radius sideNum:(NSInteger)sideNum {
    NSMutableArray<NSValue *> *cornerPoints = [NSMutableArray arrayWithCapacity:sideNum];
    
    // 这个 centerX 和 centerY 必须是 Layer 的相对中心坐标。
    CGFloat centerX = ZRHalfWidth;
    CGFloat centerY = ZRHalfWidth;
    
    for (int i = 0; i < sideNum; i++) {
        CGFloat pointX = centerX - ANGLE_COS(90.0 + 360.0 / sideNum * i) * radius;
        CGFloat pointY = centerY - ANGLE_SIN(90.0 + 360.0 / sideNum * i) * radius;
        [cornerPoints addObject:[NSValue valueWithCGPoint:CGPointMake(pointX, pointY)]];
    }
    return [cornerPoints copy];
}

- (NSArray<NSArray *> *)getPointsWithRadius:(CGFloat)radius sideNum:(NSInteger)sideNum parts:(NSInteger)parts {
    NSMutableArray *cornerPointsGroup = [NSMutableArray arrayWithCapacity:parts];
    for (int i = 1; i <= parts; i++) {
        [cornerPointsGroup addObject:[self getPointsWithRadius:(i * radius) / parts sideNum:sideNum]];
    }
    
    return [cornerPointsGroup copy];
}

- (void)addScaleAnimationWithLayer:(CALayer *)layer {
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @0;
    scaleAnimation.toValue = @1;
    scaleAnimation.duration = ZRAnimationDuration;
    
    [layer addAnimation:scaleAnimation forKey:@"scaleAnimations"];
}

@end
