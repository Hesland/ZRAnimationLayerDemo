//
//  ZRChartView.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/10.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRChartView.h"
#import "UIView+QuartzDemo.h"

#define DefaultColor [UIColor blackColor]
#define ZRPointCount 360.0

@interface ZRChartTextView : UIView

@property (nonatomic, strong) UILabel *label;

@end

@implementation ZRChartTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 10)];
        [self.label setTextColor:[UIColor whiteColor]];
        [self.label setFont:[UIFont systemFontOfSize:11]];
        [self addSubview:self.label];
    }
    return self;
}

@end

@interface ZRChartView()

@property (nonatomic, assign) NSInteger maxCount;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) ZRChartTextView *view;

@end

@implementation ZRChartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.h_center = frame.size.width * 0.5;
        self.v_center = frame.size.height * 0.5;
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
        [self addGestureRecognizer:longPress];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // 布置坐标线
    [self zr_drawChartWithRect:rect];
    [self zr_drawMedianLineWithRect:rect];
}

- (void)zr_drawMedianLineWithRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef mutablePath = CGPathCreateMutable();
    
    CGContextSetStrokeColorWithColor(context, DefaultColor.CGColor);
    
    /*
     typedef CF_ENUM(int32_t, CGLineCap) {
     kCGLineCapButt,
     kCGLineCapRound,
     kCGLineCapSquare
     };
     */
    
    CGFloat segmentLength = 5;
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGFloat lengths[] = {segmentLength, segmentLength};
    CGContextSetLineDash(context, segmentLength * 0.5, lengths, 2);
    if (self.h_center) {
        CGPathMoveToPoint(mutablePath, NULL, self.h_center, 0);
        CGPathAddLineToPoint(mutablePath, NULL, self.h_center, rect.size.height);
    }
    
    if (self.v_center) {
        CGPathMoveToPoint(mutablePath, NULL, 0, self.v_center);
        CGPathAddLineToPoint(mutablePath, NULL, rect.size.width, self.v_center);
    }
    
    CGContextAddPath(context, mutablePath);
    CGContextDrawPath(context, kCGPathStroke);
    
    CFRelease(mutablePath);
}


// chart: 走势图
- (void)zr_drawChartWithRect:(CGRect)rect {
    // 分为360个单位，即对应6个小时中每一分钟为一个单位跨度
    
    self.maxCount = 0;
    
    if ([self.dataSource respondsToSelector:@selector(numberOfPointsInChart)]) {
        self.maxCount = [self.dataSource numberOfPointsInChart];
    }
    
    if (self.maxCount > 0) {
#warning mark - 这里后续需要独立数据支持
        double unit_x = self.frame.size.width / ZRPointCount;
        // 上下限定为 [-300, 300]
        double unit_y = self.frame.size.height / 600.0;
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGMutablePathRef mutablePath = CGPathCreateMutable();
        
        for (NSInteger index = 0; index < self.maxCount; index++) {
            double value = 0;
            if ([self.dataSource respondsToSelector:@selector(chartView:valueAtIndex:)]) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
                value = [self.dataSource chartView:self valueAtIndex:indexPath];
                
                CGFloat x = unit_x * (index);
                CGFloat y = unit_y * (300 + value);
                
                if (index == 0) {
                    CGPathMoveToPoint(mutablePath, NULL, x, y);
                } else {
                    CGPathAddLineToPoint(mutablePath, NULL, x, y);
                }
            }
        }
        
        CGContextSetStrokeColorWithColor(context, DefaultColor.CGColor);
        
        CGContextAddPath(context, mutablePath);
        CGContextDrawPath(context, kCGPathStroke);
        
        CFRelease(mutablePath);
    }
}

- (void)longPressed:(UILongPressGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan: {
            [self addSubview:self.line];
            [self addSubview:self.view];
        }
            break;
        case UIGestureRecognizerStateEnded: {
            // 添加延迟三秒
            [self.line removeFromSuperview];
            [self.view removeFromSuperview];
        }
            break;
        default:
            break;
    }
    
    double unit_x = self.frame.size.width / ZRPointCount;
    NSInteger index = (NSInteger)(point.x / unit_x);
    CGFloat point_x = point.x;
    // 防止越界
    if (index > self.maxCount - 1) {
        index = self.maxCount - 1;
        point_x = index * unit_x;
    }
    
    self.line.frame = CGRectMake(point_x, 0, 0.5, self.frame.size.height);
    self.view.frame = CGRectMake(point_x, 20, 100, 30);
    
    if ([self.dataSource respondsToSelector:@selector(chartView:valueAtIndex:)]) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        double value = [self.dataSource chartView:self valueAtIndex:indexPath];
        self.view.label.text = [NSString stringWithFormat:@"value:%f",value];
    }
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor whiteColor];
    }
    
    return _line;
}

- (ZRChartTextView *)view {
    if (!_view) {
        _view = [[ZRChartTextView alloc] initWithFrame:CGRectZero];
        _view.backgroundColor = [UIColor purpleColor];
    }
    
    return _view;
}


@end
