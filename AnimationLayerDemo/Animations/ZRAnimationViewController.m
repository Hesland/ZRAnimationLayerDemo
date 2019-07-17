//
//  ZRAnimationViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/17.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRAnimationViewController.h"
#import "ZRClockViewController.h"

#define ZRTableViewCellCount 1

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
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            ZRClockViewController *clock = [[ZRClockViewController alloc] init];
            [self.navigationController pushViewController:clock animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end
