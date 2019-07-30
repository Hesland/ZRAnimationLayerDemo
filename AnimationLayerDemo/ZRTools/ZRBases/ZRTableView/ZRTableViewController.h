//
//  ZRTableViewController.h
//  ZRTools
//
//  Created by Hesland on 2018/8/25.
//  Copyright © 2018年 ZRTools. All rights reserved.
//

#import "ZRBaseViewController.h"
#import "ZRBaseTableView.h"

@interface ZRTableViewController : ZRBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) BOOL canRefresh;
@property (nonatomic, strong) ZRBaseTableView *tableView;


@end
