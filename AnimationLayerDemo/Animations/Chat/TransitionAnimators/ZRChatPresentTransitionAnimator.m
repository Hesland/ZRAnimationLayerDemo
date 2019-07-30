//
//  ZRChatPresentTransitionAnimator.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRChatPresentTransitionAnimator.h"

@implementation ZRChatPresentTransitionAnimator

- (void)startAnimation {
    UIView *fromView = self.fromViewController.view;
    
    UIView *toView = self.toViewController.view;
    CGRect frame = self.fromViewController.view.frame;
    toView.frame = frame;
    toView.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectView.frame = frame;
    
    [self.containerView addSubview:toView];
    [UIView animateWithDuration:self.transitionDuration
                     animations:^{
                         toView.transform = CGAffineTransformMakeScale(1.0, 0.7);
                         toView.center = self.fromViewController.view.center;
                         // fromView 添加毛玻璃效果
                         [fromView addSubview:effectView];
                     }
                     completion:^(BOOL finished) {
                         // containerView 添加单点手势
                         if (self.targetViewController) {
                             UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self.targetViewController action:@selector(chatCollectionViewWillDismiss)];
                             [self.containerView addGestureRecognizer:tapGesture];
                         }
                         [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
                     }];
    
}

- (void)chatCollectionViewWillDismiss {
    if ([self.targetViewController respondsToSelector:@selector(chatCollectionViewWillDismiss)]) {
        [self.targetViewController performSelector:@selector(chatCollectionViewWillDismiss)];
    }
}

@end
