//
//  ZRAnimationGroupViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/21.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRAnimationGroupViewController.h"

@interface ZRAnimationGroupViewController ()

@property (nonatomic, strong) CALayer *animationItem;


@end

@implementation ZRAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"animation group";
    
    self.animationItem = [[CALayer alloc] init];
    self.animationItem.backgroundColor = [UIColor orangeColor].CGColor;
    self.animationItem.frame = CGRectMake(0, 0, 200, 200);
    
    [self.view.layer addSublayer:self.animationItem];
}

- (void)viewWillAppear:(BOOL)animated {
    [self createAnimationGroup];
}

- (void)createAnimationGroup {
    CAAnimationGroup *animGroup = [[CAAnimationGroup alloc] init];
    
    CABasicAnimation *rotateAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnim.toValue = @(M_PI * 2);
    
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.toValue = @(0.2);
    
    CAKeyframeAnimation *keyframeAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *movePath = [UIBezierPath bezierPathWithArcCenter:self.view.center
                                                            radius:130
                                                        startAngle:0
                                                          endAngle:2 * M_PI clockwise:YES];
    keyframeAnim.path = movePath.CGPath;
    keyframeAnim.calculationMode = kCAAnimationPaced;
    
    /*
     CA_EXTERN CAMediaTimingFunctionName const kCAMediaTimingFunctionLinear
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CAMediaTimingFunctionName const kCAMediaTimingFunctionEaseIn
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CAMediaTimingFunctionName const kCAMediaTimingFunctionEaseOut
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CAMediaTimingFunctionName const kCAMediaTimingFunctionEaseInEaseOut
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CAMediaTimingFunctionName const kCAMediaTimingFunctionDefault
     API_AVAILABLE(macos(10.6), ios(3.0), watchos(2.0), tvos(9.0));
     */
    keyframeAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animGroup.animations = @[rotateAnim, scaleAnim, keyframeAnim];
    animGroup.repeatCount = CGFLOAT_MAX;
    animGroup.duration = 2;
    
    [self.animationItem addAnimation:animGroup forKey:@"animGroup"];
}


@end
