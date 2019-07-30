//
//  ZRAnimationViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/17.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRClockViewController.h"
#import "ZRTransViewController.h"
#import "ZRChatListViewController.h"
#import "ZRAnimationViewController.h"
#import "ZRBasicAnimationViewController.h"
#import "ZRAnimationGroupViewController.h"
#import "ZREmitterAnimationViewController.h"
#import "ZRKeyframeAnimationViewController.h"
#import "ZRValueDistributionMapViewController.h"


#define ZRTableViewCellCount 5

@interface ZRAnimationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataSource;

@end

@implementation ZRAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"animations";
    
    self.tableView = [[UITableView alloc] initWithFrame:SCREEN_BOUNDS];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    /*
     UIView *test = [[UIView alloc] init];
     test.backgroundColor = [UIColor blueColor];
     [self.tableView addSubview:test];
     
     [test mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.mas_equalTo(self.view.mas_left).offset(50);
     make.right.mas_equalTo(self.view.mas_right).offset(-50);
     make.height.mas_equalTo(@80);
     make.top.mas_equalTo(self.tableView.mas_top).offset(120);
     }];
     */
    
    // @{ @"id": @"", @"title":@"", @"class": @""},
    NSArray *dataSource = @[
                            @{ @"id": @"basicAnimation", @"title":@"basic animation", @"class": @"ZRBasicAnimationViewController"},
                            @{ @"id": @"keyFrameAnimation", @"title":@"key frame animation", @"class": @"ZRKeyframeAnimationViewController"},
                            @{ @"id": @"emitterAnimation", @"title":@"emitter animation", @"class": @"ZREmitterAnimationViewController"},
                            @{ @"id": @"animationGroup", @"title":@"animation group", @"class": @"ZRAnimationGroupViewController"},
                            @{ @"id": @"distributionMap", @"title":@"distribution map", @"class": @"ZRValueDistributionMapViewController"},
                            @{ @"id": @"clock", @"title":@"clock", @"class": @"ZRClockViewController"},
                            @{ @"id": @"transition animation", @"title":@"transitionAnimation", @"class": @"ZRTransViewController"},
                            @{ @"id": @"chat view", @"title":@"chat view", @"class": @"ZRChatListViewController"},
                            ];
    
    self.dataSource = dataSource;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identfier = @"ZRAnimationDemoID";
    NSDictionary *data = self.dataSource[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[data valueForKey:@"id"]];
        cell.textLabel.text = [data valueForKey:@"title"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = [self.dataSource[indexPath.row] valueForKey:@"class"];
    NSString *assert = @"Class name should not be nil!";
    NSAssert(className.length > 0, assert);
    
    Class class = NSClassFromString(className);
    assert = [NSString stringWithFormat:@"Please create this class:%@!", className];
    NSAssert(class != nil, assert);
    ZRBaseViewController *viewController = [[class alloc] init];
    if ([viewController isKindOfClass:[ZRTransViewController class]]) {
        ((ZRTransViewController *)viewController).present = YES;
    }
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
