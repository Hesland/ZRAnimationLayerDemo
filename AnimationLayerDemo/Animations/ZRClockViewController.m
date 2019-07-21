//
//  ZRClockViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/17.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRClockViewController.h"
#import "UIImage+ZRClip.h"

#define ZRRedColor      [UIColor redColor]
#define ZRDarkGrayColor [UIColor darkGrayColor]

@interface ZRClockViewController ()
@property (nonatomic, strong) UIView *secondView;
@property (nonatomic, strong) UIView *minuteView;
@property (nonatomic, strong) UIView *hourView;

@end

@implementation ZRClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"clock";
    
    UIImage *image = [UIImage zr_clipRoundedImageWithImageName:@"clock"];
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = (CGRect){{0, 0}, image.size};
    layer.position = self.view.center;
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    [self.view.layer addSublayer:layer];
    
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 60)];
    secondView.backgroundColor = ZRRedColor;
    secondView.center = self.view.center;
    
    secondView.layer.anchorPoint = CGPointMake(0.5, 1);
    [self.view addSubview:secondView];
    self.secondView = secondView;
    
    UIView *minuteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, 50)];
    minuteView.backgroundColor = ZRDarkGrayColor;
    minuteView.center = self.view.center;
    
    minuteView.layer.anchorPoint = CGPointMake(0.5, 1);
    [self.view addSubview:minuteView];
    self.minuteView = minuteView;
    
    UIView *hourView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 30)];
    hourView.backgroundColor = ZRDarkGrayColor;
    hourView.center = self.view.center;
    
    hourView.layer.anchorPoint = CGPointMake(0.5, 1);
    [self.view addSubview:hourView];
    self.hourView = hourView;
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(clockRunning)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)clockRunning {
    NSTimeZone *tZone = [NSTimeZone localTimeZone];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = tZone;
    NSDate *currentDate = [NSDate date];
    
    NSDateComponents *currentTime = [calendar components:NSCalendarUnitSecond|NSCalendarUnitMinute|NSCalendarUnitHour|NSCalendarUnitTimeZone fromDate:currentDate];
    
    CGFloat angle = M_PI * 2 * currentTime.second / 60;
    self.secondView.transform = CGAffineTransformMakeRotation(angle);
    //    NSLog(@"angle---%f", angle);
    CGFloat minuteAngle = (M_PI * 2 * currentTime.minute + angle) / 60;
    //    NSLog(@"minuteAngle---%f", minuteAngle);
    self.minuteView.transform = CGAffineTransformMakeRotation(minuteAngle);
    CGFloat hourAngle = (M_PI * 2 * currentTime.hour + minuteAngle) / 12;
    //    NSLog(@"hourAngle---%f", hourAngle);
    self.hourView.transform = CGAffineTransformMakeRotation(hourAngle);
}


@end
