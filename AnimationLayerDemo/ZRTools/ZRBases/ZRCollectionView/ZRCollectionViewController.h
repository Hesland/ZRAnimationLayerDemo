//
//  ZRCollectionViewController.h
//  ZRTools
//
//  Created by Hesland on 2018/8/25.
//  Copyright © 2018年 ZRTools. All rights reserved.
//

#import "ZRBaseViewController.h"

@class ZRBaseCollectionView;

@interface ZRCollectionViewController : ZRBaseViewController

/// 是否允许加载 refresh 控件
@property (nonatomic, assign, getter=canRefresh) BOOL refresh;
/// 是否允许拖动
@property (nonatomic, assign, getter=isScrollEnable) BOOL scrollEnable;

@property (nonatomic, strong) ZRBaseCollectionView *collectionView;


@end
