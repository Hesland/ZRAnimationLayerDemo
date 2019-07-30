//
//  ZRTableViewController.m
//  ZRTools
//
//  Created by Hesland on 2018/8/25.
//  Copyright © 2018年 ZRTools. All rights reserved.
//

#import "ZRTableViewController.h"

@interface ZRTableViewController () 

@end

@implementation ZRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    return cell;
}

- (ZRBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[ZRBaseTableView alloc] initWithFrame:SCREEN_BOUNDS];
    }
    return _tableView;
}

@end
