//
//  ZRImageManager.h
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/19.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZRImageManager : NSObject

@property (nonatomic, strong) NSMutableDictionary *images;

+ (instancetype)sharedManager;

@end

NS_ASSUME_NONNULL_END
