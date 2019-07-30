//
//  ZRChatPresentTransitionAnimator.h
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRBaseTransitionAnimator.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZRChatPresentTransitionAnimator : ZRBaseTransitionAnimator

@property (nonatomic, strong) id<UIViewControllerTransitioningDelegate> targetViewController;

@end

NS_ASSUME_NONNULL_END
