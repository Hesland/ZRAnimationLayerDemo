//
//  ZRBaseTransitionAnimator.h
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZRBaseTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter=isPresent) BOOL present;

@property (nonatomic, strong) UIViewController *fromViewController;
@property (nonatomic, strong) UIViewController *toViewController;
@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic, assign, readonly) NSTimeInterval transitionDuration;

- (instancetype)initWithTransitionDuration:(NSTimeInterval)transitionDuration;

- (void)startAnimation;

@end

NS_ASSUME_NONNULL_END
