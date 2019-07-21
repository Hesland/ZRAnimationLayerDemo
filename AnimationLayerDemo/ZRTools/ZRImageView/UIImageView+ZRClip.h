//
//  UIImageView+ZRClip.h
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/19.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (ZRClip)


/**
 Create an image view with image name.
 This created image view will sized with image's size.

 @param imageName Image's path or name.
 @return UIImageView object.
 */
+ (instancetype)zr_clipRoundedImageWithImageName:(NSString * _Nonnull)imageName;

@end

NS_ASSUME_NONNULL_END
