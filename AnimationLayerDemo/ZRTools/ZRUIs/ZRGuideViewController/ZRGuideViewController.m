//
//  ZRGuideViewController.m
//  ZRTools
//
//  Created by Hesland on 2018/8/25.
//  Copyright © 2018年 ZRTools. All rights reserved.
//

#import "ZRGuideViewController.h"

@interface ZRGuideViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView  *guideScrollView;
@property (nonatomic, strong) UIPageControl *guidePageControl;

@property (nonatomic, strong) UIButton    *btnDismiss;
@end

@implementation ZRGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor   = [UIColor clearColor];
//    self.fd_prefersNavigationBarHidden = YES;
    self.guideScrollView             = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.guideScrollView.contentSize = CGSizeMake(self.index * SCREEN_WIDTH + 1, SCREEN_HEIGHT);
    [self.guideScrollView setUserInteractionEnabled:YES];
    [self.guideScrollView setScrollEnabled:YES];
    [self.guideScrollView setPagingEnabled:YES];
    [self.guideScrollView setShowsHorizontalScrollIndicator:NO];
    [self.guideScrollView setShowsVerticalScrollIndicator:NO];
    [self.guideScrollView setBounces:NO];
    [self.guideScrollView setDelegate:self];
    [self setGuidePageImageFrame];
    [self.view addSubview:self.guideScrollView];
    
    _btnDismiss = [[UIButton alloc]init];
    _btnDismiss.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    _btnDismiss.layer.cornerRadius = 4;
    _btnDismiss.clipsToBounds = true;
    [_btnDismiss setTitle:@"跳过" forState:UIControlStateNormal];
    [_btnDismiss setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnDismiss.titleLabel.font = [UIFont systemFontOfSize:14];
    //    _btnDismiss.titleEdgeInsets = UIEdgeInsetsMake(5, 8, 5, 4);
    
    [_btnDismiss addTarget:self action:@selector(goNextStep)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnDismiss];
    
    [self.btnDismiss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@40);
        make.right.equalTo(@(-15));
        make.width.equalTo(@60);
        make.height.equalTo(@25);
    }];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (NSInteger)getIndex {
    
    
    return 3;
}

- (void)setGuidePageImageFrame {
    //    CGFloat         height           = MAX(screenBounds.size.height,screenBounds.size.width);
    NSMutableArray *splashImageNames = [NSMutableArray array];
    for (int i = 1; i <= self.index; i++) {
        NSString *imageName   = [NSString stringWithFormat:@"引导页0%d",i];
        
        if (imageName) {
            [splashImageNames addObject:imageName];
        }
    }
    
    for (int i = 0; i < splashImageNames.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.guideScrollView.frame.size.width, 0, self.guideScrollView.frame.size.width, self.guideScrollView.frame.size.height)];
        imageView.image       = [UIImage imageNamed:splashImageNames[i]];
        imageView.contentMode = UIViewContentModeScaleToFill;
        [self.guideScrollView addSubview:imageView];
    }
    self.guideScrollView.contentSize = CGSizeMake(splashImageNames.count * self.guideScrollView.frame.size.width, self.guideScrollView.frame.size.height);
    
    UIImage  *btnImage = [UIImage imageNamed:@"Bitmap"];
    CGSize    size     = btnImage.size;
    UIButton *nextBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake((splashImageNames.count - 1) * self.guideScrollView.frame.size.width + (self.guideScrollView.frame.size.width - size.width) / 2, self.guideScrollView.frame.size.height - size.height - 40, size.width, size.height);
    [nextBtn setImage:btnImage forState:UIControlStateNormal];
    
    [nextBtn addTarget:self action:@selector(goNextStep)forControlEvents:UIControlEventTouchUpInside];
    [self.guideScrollView addSubview:nextBtn];
}

- (void)goNextStep {
    if (self.block) {
        self.block();
        self.block = nil;
    }
}

#pragma mark ---UIScrollViewDelegate

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetWidth = self.guideScrollView.contentOffset.x;
    int pageNum = offsetWidth / SCREEN_WIDTH;
    if (offsetWidth > (self.index - 1) * SCREEN_WIDTH) {
        [UIView animateWithDuration:1.25 animations:^{
            CGAffineTransform newTRansform = CGAffineTransformMakeScale(1.2, 1.2);
            [(UIImageView*)[self.guideScrollView.subviews lastObject] setTransform:newTRansform];
            [(UIImageView*)[self.guideScrollView.subviews lastObject] setTransform:newTRansform];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1.2 animations:^{
                [(UIImageView*)[self.guideScrollView.subviews lastObject] setAlpha:0];
                [(UIImageView*)[self.guideScrollView.subviews lastObject] setAlpha:0];
            } completion:^(BOOL finished) {
                if (self.block) {
                    self.block();
                }
            }];
        }];
    } else {
        self.guidePageControl.currentPage = pageNum;
        self.guidePageControl.hidden      = (pageNum == (self.guidePageControl.numberOfPages - 1));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
