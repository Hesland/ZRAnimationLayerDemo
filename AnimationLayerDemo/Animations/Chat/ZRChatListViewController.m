//
//  ZRChatViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRChatDismissTransitionAnimator.h"
#import "ZRChatPresentTransitionAnimator.h"
#import "ZRChatCollectionViewController.h"
#import "ZRChatListViewController.h"
#import "ZRChatViewController.h"
#import "ZRChatTableViewCell.h"

@interface ZRChatListViewController ()<ZRChatTableViewCellLongPressedDelegate>

@end

@implementation ZRChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZRChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZRChatCellID"];
}

// MARK: UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZRChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZRChatCellID"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}

// MARK: UITableViewDelegate methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // prepare data
    NSDictionary *data = nil;
    ZRChatViewController *chatViewController = [[ZRChatViewController alloc] init];
    if (data) {
        chatViewController.data = data;
    }
    chatViewController.title = [NSString stringWithFormat:@"cell - %ld", (long)indexPath.row];
    [self.navigationController pushViewController:chatViewController animated:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    ZRChatPresentTransitionAnimator *present = [[ZRChatPresentTransitionAnimator alloc] initWithTransitionDuration:0.5];
    present.targetViewController = self;
    return present;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[ZRChatDismissTransitionAnimator alloc] initWithTransitionDuration:0.0];
}

// MARK: ZRChatTableViewCellLongPressedDelegate methods
- (void)chatTableViewCellDidLongPressed {
    ZRChatCollectionViewController *collectionView = [[ZRChatCollectionViewController alloc] init];
    collectionView.modalPresentationStyle = UIModalPresentationCustom;
    collectionView.transitioningDelegate = self;
    [self presentViewController:collectionView animated:YES completion:nil];
}

- (void)chatCollectionViewWillDismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
