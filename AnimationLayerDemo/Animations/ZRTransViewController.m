//
//  ZRTransViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRTransViewController.h"
#import "ZRBaseNavigationController.h"

@interface ZRTransAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter=isPresented) BOOL presented;

@property (nonatomic, strong) id <UIViewControllerContextTransitioning> transitionContext;
@property (nonatomic, strong) UIViewController *fromViewController;
@property (nonatomic, strong) UIViewController *toViewController;
@property (nonatomic, strong) UIView *containerView;

@end

@implementation ZRTransAnimator

- (instancetype)init {
    self = [super init];
    if (self) {
        self.presented = YES;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.containerView = transitionContext.containerView;
    self.transitionContext = transitionContext;
    [self startAnimation];
}

- (void)startAnimation {
    if (self.isPresented) {
        // 当前控制器的view
        UIView *currentView   = self.fromViewController.view;
        currentView.transform = CGAffineTransformMakeScale(1.f, 1.f);
        
        // 变化的控制器的view
        UIView *toView = self.toViewController.view;
        CGRect frame = toView.frame;
        frame.origin.y = -frame.size.height;
//        frame.origin.x = -frame.size.width;
        toView.frame = frame;
        
        // 管理容器 + 添加toView
        [self.containerView addSubview:toView];
        
        // 执行动画
        [UIView animateWithDuration:1.0
                              delay:0.f
             usingSpringWithDamping:1.f
              initialSpringVelocity:0.f
                            options:0
                         animations:^{
                             currentView.transform = CGAffineTransformMakeScale(0.7, 0.7);
                             toView.center         = self.containerView.center;
                         }
                         completion:^(BOOL finished) {
                             [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
                         }];
    } else {
        // 当前控制器的view
        UIView *currentView = self.fromViewController.view;
        
        // 变化的控制器的view
        UIView *toView   = self.toViewController.view;
        toView.transform = CGAffineTransformMakeScale(0.7, 0.7);
        
        // 执行动画
        [UIView animateWithDuration:1.0
                              delay:0.f
             usingSpringWithDamping:1.f
              initialSpringVelocity:0.f
                            options:0
                         animations:^{
                             CGRect frame = currentView.frame;
                             frame.origin.y = SCREEN_HEIGHT;
                             currentView.frame = frame;
//                             currentView.y    = SCREEN_HEIGHT;
                             toView.transform = CGAffineTransformMakeScale(1.f, 1.f);
                         }
                         completion:^(BOOL finished) {
                             [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
                         }];
    }
    
}

@end

@interface ZRTransNavigationViewController : ZRBaseNavigationController <UIViewControllerTransitioningDelegate>

@end

@implementation ZRTransNavigationViewController

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    ZRTransAnimator *presentAnimator = [[ZRTransAnimator alloc] init];
    return presentAnimator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    ZRTransAnimator *dismissAnimator = [[ZRTransAnimator alloc] init];
    dismissAnimator.presented = NO;
    return dismissAnimator;
}

@end

@interface ZRTransViewController ()

@end

@implementation ZRTransViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"transtion animation";
    if (self.demoColor) {
        self.view.backgroundColor = self.demoColor;
    }
    UIButton *eventButton = [UIButton buttonWithType:UIButtonTypeCustom];
    eventButton.frame = CGRectMake(0, 0, 100, 50);
    
    if (!self.isPresent) {
        [eventButton setTitle:@"dismiss" forState:UIControlStateNormal];
        [eventButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *push = [UIButton buttonWithType:UIButtonTypeCustom];
        push.frame = CGRectMake(SCREEN_WIDTH - 100, 0, 100, 50);
        [push setTitle:@"push" forState:UIControlStateNormal];
        [push addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
        [push setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:push];
        
    } else {
        [eventButton setTitle:@"present" forState:UIControlStateNormal];
        [eventButton addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [eventButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:eventButton];
    
}

- (void)push {
    ZRTransViewController *vc = [[ZRTransViewController alloc] init];
    vc.demoColor = [UIColor purpleColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)present {
    ZRTransViewController *vc = [[ZRTransViewController alloc] init];
    vc.demoColor = [UIColor yellowColor];
    ZRTransNavigationViewController *navi = [[ZRTransNavigationViewController alloc] initWithRootViewController:vc];
    navi.view.frame = CGRectMake(0, 100, SCREEN_WIDTH, 300);
    navi.modalPresentationStyle = UIModalPresentationCustom;
    navi.transitioningDelegate = navi;
    [self presentViewController:navi animated:YES completion:nil];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end


