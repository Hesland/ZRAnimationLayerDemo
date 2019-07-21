//
//  UIImageView+ZRClip.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/19.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "UIImageView+ZRClip.h"
#import "UIImage+ZRClip.h"

@implementation UIImageView (ZRClip)

+ (instancetype)zr_clipRoundedImageWithImageName:(NSString * _Nonnull)imageName {
    return [[UIImageView alloc] initWithImage:[UIImage zr_clipRoundedImageWithImageName:imageName]];
}

@end
