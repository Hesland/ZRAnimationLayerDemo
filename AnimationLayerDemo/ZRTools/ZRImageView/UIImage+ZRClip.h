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
 Create a rounded image view with required image.
 Rect and corner radius are caculated by image size.

 @param image Setup image view's image.
 @return UIImageView object.
 */

+ (instancetype)zr_clipRoundedImageWithImage:(UIImage * _Nonnull)image;

@end

NS_ASSUME_NONNULL_END
