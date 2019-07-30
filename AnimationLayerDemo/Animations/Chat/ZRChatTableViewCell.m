//
//  ZRChatTableViewCell.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRChatTableViewCell.h"

@interface ZRChatTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *mainTitle;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *messageCount;

@property (nonatomic, strong) UILongPressGestureRecognizer *longGesture;


@end

@implementation ZRChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed)];
    [self addGestureRecognizer:longGesture];
    self.longGesture = longGesture;
}

- (void)longPressed {
    // 添加长按手势 -> 呼出 collectionView
    if (self.longGesture.state == UIGestureRecognizerStateChanged) {
        @synchronized (self) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"long pressed, %ld", (long)self.longGesture.state);
                if ([self.delegate respondsToSelector:@selector(chatTableViewCellDidLongPressed)]) {
                    [self.delegate chatTableViewCellDidLongPressed];
                }
            });
        }
    }
    
    // 代理回调 -> 想办法模仿 RAC 完成绑定回调
    
    // 事件传递应当线程加锁。
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
