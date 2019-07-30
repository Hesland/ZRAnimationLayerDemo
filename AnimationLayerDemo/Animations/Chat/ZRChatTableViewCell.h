//
//  ZRChatTableViewCell.h
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZRChatTableViewCellLongPressedDelegate <NSObject>

- (void)chatTableViewCellDidLongPressed;

@end

@interface ZRChatTableViewCell : UITableViewCell

@property (nonatomic, copy) NSDictionary *data;
@property (nonatomic, weak) id<ZRChatTableViewCellLongPressedDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
