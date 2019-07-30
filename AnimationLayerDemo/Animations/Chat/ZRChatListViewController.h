//
//  ZRChatViewController.h
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZRChatListViewController : ZRTableViewController <UIViewControllerTransitioningDelegate>

- (void)chatCollectionViewWillDismiss;

@end

NS_ASSUME_NONNULL_END
