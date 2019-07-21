//
//  ZRAnimationViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/17.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRClockViewController.h"
#import "ZRAnimationViewController.h"
#import "ZRBasicAnimationViewController.h"
#import "ZRAnimationGroupViewController.h"
#import "ZRKeyframeAnimationViewController.h"

#define ZRTableViewCellCount 4

@interface ZRAnimationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ZRAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"animations";
    
    self.tableView = [[UITableView alloc] initWithFrame:SCREEN_BOUNDS];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ZRTableViewCellCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    switch (indexPath.row) {
        case 0: {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"clock"];
            cell.textLabel.text = @"clock";
        }
            break;
        case 1: {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"basicAnimation"];
            cell.textLabel.text = @"basic animation";
        }
            break;
        case 2: {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"animationGroup"];
            cell.textLabel.text = @"animation group";
        }
            break;
        case 3: {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"keyFrameAnimation"];
            cell.textLabel.text = @"key frame animation";
        }
            break;
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZRBaseViewController *viewController = nil;
    switch (indexPath.row) {
        case 0: {
            viewController = [[ZRClockViewController alloc] init];
        }
            break;
        case 1: {
            viewController = [[ZRBasicAnimationViewController alloc] init];
        }
            break;
        case 2: {
            viewController = [[ZRAnimationGroupViewController alloc] init];
        }
            break;
        case 3: {
            viewController = [[ZRKeyframeAnimationViewController alloc] init];
        }
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
