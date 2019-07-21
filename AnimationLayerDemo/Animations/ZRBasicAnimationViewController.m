//
//  ZRBasicAnimationViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/18.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRBasicAnimationViewController.h"

@interface ZRBasicAnimationViewController () <CAAnimationDelegate>

@property (nonatomic, strong) CALayer *layer;


@end

@implementation ZRBasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"basic animation";
    
//    CAAnimation *animation = [[CAAnimation alloc] init];
//    animation.repeatCount = CGFLOAT_MAX; // 无限次循环
    
    [self createBasicAnimation];
    
}

- (void)createBasicAnimationWithLayer:(CALayer *)layer fromValue:(NSValue *)from toValue:(NSValue *)to {
    
}

- (void)createBasicAnimation {
    CALayer *layer = [[CALayer alloc] init];
    
//    layer.position = CGPointMake(0, 0);
    layer.bounds = CGRectMake(0, 0, 100, 120);
    layer.backgroundColor = [UIColor grayColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    self.layer = layer;
    
    CABasicAnimation *basicAnimation = [[CABasicAnimation alloc] init];
    basicAnimation.keyPath = @"position";
    
    basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 0)];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 200)];
    
    basicAnimation.duration = 2.0;
    
    /* `fillMode' options. */
    /*
     CA_EXTERN CAMediaTimingFillMode const kCAFillModeForwards
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CAMediaTimingFillMode const kCAFillModeBackwards
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CAMediaTimingFillMode const kCAFillModeBoth
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     CA_EXTERN CAMediaTimingFillMode const kCAFillModeRemoved
     API_AVAILABLE(macos(10.5), ios(2.0), watchos(2.0), tvos(9.0));
     */
    
    basicAnimation.fillMode = kCAFillModeBoth;
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.delegate = self;
    [self.layer addAnimation:basicAnimation forKey:@"move"];
}

- (void)animationDidStart:(CAAnimation *)anim {
    self.layer.position = CGPointMake(300, 200);
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        self.layer.position = CGPointMake(300, 200);
    } else {
        
    }
}

@end
