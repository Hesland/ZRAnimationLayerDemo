//
//  ZREmitterAnimationViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/25.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZREmitterAnimationViewController.h"

@interface ZREmitterAnimationViewController ()

@end

@implementation ZREmitterAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Sparkler";
    
    self.view.backgroundColor = [UIColor blackColor];
    
    CAEmitterLayer *emitterLayer = [[CAEmitterLayer alloc] init];
    
    [self.view.layer addSublayer:emitterLayer];
    
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    emitterCell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"dot"].CGImage);

    emitterCell.birthRate = 150;
    emitterCell.lifetime = 0.3;
    emitterCell.lifetimeRange = 1.5;
    
    emitterCell.velocity = 300;// 初始速度，正值向上
    emitterCell.velocityRange = 30;// 初始速度的可变范围
    
//    emitterCell.emissionLatitude = 0.8;
//    emitterCell.emissionLongitude = 1.2;
    emitterCell.emissionRange = M_PI_4; // 发射角度范围，具体的发射方向是随机的
    
    emitterCell.yAcceleration = 200; // y轴加速度，正值向下
    
    
    emitterCell.color = [UIColor orangeColor].CGColor;
    
    emitterCell.greenRange = 0.8;
    emitterCell.greenSpeed = 0.1;
    emitterCell.blueRange = 0.8;
    emitterCell.blueSpeed = 0.5;
    emitterCell.redRange = 0.8;
    emitterCell.redSpeed = 0.9;
    
    emitterCell.scale = 0.3;
    emitterCell.scaleRange = 0.3;
    emitterCell.scaleSpeed = -0.1;
    
    emitterLayer.emitterCells = @[emitterCell];
    
    emitterLayer.emitterPosition = self.view.center;
    emitterLayer.emitterSize = CGSizeMake(1, 100);
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
}


@end
