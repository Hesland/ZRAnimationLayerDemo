//
//  UIImageView+ZRClip.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/19.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "UIImage+ZRClip.h"
#import "ZRImageManager.h"
#define ZRRoundImagesPath [NSString stringWithFormat:@"%@/Documents/RoundImages/", NSHomeDirectory()]

@implementation UIImage (ZRClip)

+ (instancetype)zr_clipRoundedImageWithImageName:(NSString * _Nonnull)imageName {
    UIImage *targetImage = nil;
    // memory cache -> hash map
    NSMutableDictionary *images = [ZRImageManager sharedManager].images;
    if ([images objectForKey:imageName]) {
        targetImage = (UIImage *)[images objectForKey:imageName];
    } else {
        // URLCache
        ZRCreateDirIfNeed(ZRRoundImagesPath);
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *imagePath = [NSString stringWithFormat:@"%@%@@2x.jpg", ZRRoundImagesPath, imageName];
        BOOL imageExist = [fileManager fileExistsAtPath:imagePath];
        if (imageExist) {
            targetImage = [[UIImage alloc] initWithContentsOfFile:imagePath];
        } else {
            UIImage *image = [UIImage imageNamed:imageName];
            if (image == nil) {
                return nil;
            }
            
            CGSize size = image.size;
            CGRect rect = CGRectMake(0, 0, size.width, size.height);
            
            UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
            CGContextRef context = UIGraphicsGetCurrentContext();
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:size];
            CGContextAddPath(context, path.CGPath);
            CGContextClip(context);
            [image drawInRect:rect];
            CGContextDrawPath(context, kCGPathFillStroke);
            
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            // memory cache
            [[ZRImageManager sharedManager].images setObject:newImage forKey:imageName];
            // URLCache
            NSData *imageData = UIImagePNGRepresentation(newImage);
            // 缩略处理可用
//            UIImageJPEGRepresentation(<#UIImage * _Nonnull image#>, <#CGFloat compressionQuality#>)
            
            [imageData writeToFile:imagePath atomically:NO];
            targetImage = newImage;
        }
    }
    
    return targetImage;
}



@end
