//
//  ViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/5.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *layer;

@end

@class ZRCircleView;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createNewLayerWithBezierPath];
    
}

- (void)createNewLayerWithBezierPath {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 200, 200)];
    path.lineWidth = 5.0;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor grayColor].CGColor;
    layer.path = path.CGPath;
    
    [path removeAllPoints];
    
    [self.view.layer addSublayer:layer];
    
    [path moveToPoint:CGPointMake(30, 30)];
    [path addLineToPoint:CGPointMake(130, 30)];
    [path addLineToPoint:CGPointMake(130, 130)];
    [path addLineToPoint:CGPointMake(30, 130)];
    [path addLineToPoint:CGPointMake(30, 30)];
    
    CAShapeLayer *anotherLayer = [CAShapeLayer layer];
    anotherLayer.strokeColor = [UIColor greenColor].CGColor;
    anotherLayer.fillColor = [UIColor yellowColor].CGColor;
    anotherLayer.path = path.CGPath;
    
    [path removeAllPoints];
    
    [self.view.layer addSublayer:anotherLayer];
}

- (void)createNewDIYView {
    ZRDrawView *drawView = [[ZRDrawView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:drawView];
}

- (void)createNewLayer {
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    
    [self.view.layer addSublayer:layer];
    
    self.layer = layer;
}

- (void)setLayerImageWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) {
        self.layer.contents = (__bridge id)image.CGImage;
    }
}


@end

@implementation ZRDrawView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawCircleWithRect:rect];
//    [self drawRectWithRect:rect];
}

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
