//
//  UIImageView+ZRClip.h
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/19.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZRClip)

/**
 Create a rounded image with target image name.
 Rect and corner radius are caculated by image size.

 @param imageName Image's name or path.
 @return UIImageView object.
 */

+ (instancetype)zr_clipRoundedImageWithImageName:(NSString * _Nonnull)imageName;

@end

NS_ASSUME_NONNULL_END
