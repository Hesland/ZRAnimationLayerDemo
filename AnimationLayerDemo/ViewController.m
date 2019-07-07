//
//  ViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/5.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ViewController.h"
#import "UIView+QuartzDemo.h"

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
    // 创建贝塞尔曲线，根据贝塞尔曲线的状态来变更Layer视图
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




@end
