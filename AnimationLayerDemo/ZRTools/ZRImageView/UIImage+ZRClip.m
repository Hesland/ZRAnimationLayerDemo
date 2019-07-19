//
//  UIImageView+ZRClip.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/19.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "UIImageView+ZRClip.h"

@implementation UIImageView (ZRClip)

+ (instancetype)zr_clipRoundedImageWithImage:(UIImage * _Nonnull)image {
    CGRect rect = (CGRect){{0, 0}, image.size};
    CGFloat radius = MIN(image.size.width, image.size.height);
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
//    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
//
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
//    [path addClip];
//
//    [imageView drawRect:rect];
//    UIImage *clipedImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
//    imageView.image = clipedImage;
    imageView.image = [UIImageView zr_image_clipRoundedImageWithImage:image];
    return imageView;
}

+ (UIImage *)zr_image_clipRoundedImageWithImage:(UIImage * _Nonnull)image {
    
    CGSize size = image.size;
    CGFloat radius = MIN(image.size.width, image.size.height);
    CGRect rect = CGRectMake(0, 0, size.width, size.height); UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [image drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
