//
//  ZRChatDismissTransitionAnimator.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRChatDismissTransitionAnimator.h"

@implementation ZRChatDismissTransitionAnimator

- (void)startAnimation {
    for (UIView *view in self.toViewController.view.subviews) {
        // 移除毛玻璃效果 -> 倒序查找更佳
        if ([view isKindOfClass:[UIVisualEffectView class]]) {
            [view removeFromSuperview];
            break;
        }
    }
    
    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
}

@end
