//
//  ZRImageManager.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/19.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRImageManager.h"

@interface ZRImageManager ()

@end

@implementation ZRImageManager

+ (instancetype)sharedManager {
    static ZRImageManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZRImageManager alloc] init];
        manager.images = [NSMutableDictionary dictionary];
    });
    
    return manager;
}

@end
