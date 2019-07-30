//
//  ZRBaseTransitionAnimator.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRBaseTransitionAnimator.h"

@interface ZRBaseTransitionAnimator ()

@property (nonatomic, assign, readwrite) NSTimeInterval transitionDuration;


@end

@implementation ZRBaseTransitionAnimator

- (instancetype)init {
    self = [super init];
    if (self) {
        self.transitionDuration = 1.0;
    }
    return self;
}

// MARK: UIViewControllerAnimatedTransitioning methods
- (instancetype)initWithTransitionDuration:(NSTimeInterval)transitionDuration {
    self = [self init];
    if (self) {
        self.transitionDuration = transitionDuration;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return self.transitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.containerView = transitionContext.containerView;
    self.transitionContext = transitionContext;
    
    [self startAnimation];
}

- (void)startAnimation {
    NSAssert(NO, @"Please implement this method in concrete classes.");
}

@end
