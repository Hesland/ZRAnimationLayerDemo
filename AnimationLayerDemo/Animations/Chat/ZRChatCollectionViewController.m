//
//  ZRChatCollectionViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRChatCollectionViewController.h"

#define ZRChatCollectionViewCellID  @"ZRChatCollectionViewCellID"

@interface ZRScaleFlowLayout : UICollectionViewFlowLayout

@end

@implementation ZRScaleFlowLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray * attributes = [[NSMutableArray alloc] init];
    //遍历设置每个item的布局属性
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    //创建一个item布局属性类
    UICollectionViewLayoutAttributes *atti = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //获取item的个数
    int itemCounts = (int)[self.collectionView numberOfItemsInSection:0];
    //设置每个item的大小为260*100
    
    atti.size = CGSizeMake(100, 100);//CGSizeMake(self.collectionView.frame.size.width * 0.7, self.collectionView.frame.size.height - 20);
    atti.center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2);
    //创建一个transform3D类
    //CATransform3D是一个类似矩阵的结构体
    //CATransform3DIdentity创建空得矩阵
    CATransform3D trans3D = CATransform3DIdentity;
    //这个值设置的是透视度，影响视觉离投影平面的距离
    trans3D.m34 = -1/900.0;
    //下面这些属性 后面会具体介绍
    //这个是3D滚轮的半径
    CGFloat radius = 50/tanf(M_PI*2/itemCounts/2);
    //计算每个item应该旋转的角度
    CGFloat angle = (float)(indexPath.row)/itemCounts*M_PI*2;
    //这个方法返回一个新的CATransform3D对象，在原来的基础上进行旋转效果的追加
    //第一个参数为旋转的弧度，后三个分别对应x，y，z轴，我们需要以x轴进行旋转
//    trans3D = CATransform3DRotate(trans3D, angle, 0, 1.0, 0);
    trans3D = CATransform3DTranslate(trans3D, 0, 0, radius);
    trans3D = CATransform3DScale(trans3D, 1.2, 1.2, 1);
    //进行设置
    atti.transform3D = trans3D;
    /*
     后边介绍的代码添加在这里
     
     */
    return atti;
}

@end

@interface ZRChatCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ZRChatCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    ZRScaleFlowLayout *layout = [[ZRScaleFlowLayout alloc] init];
    ZRBaseCollectionView *collectionView = [[ZRBaseCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ZRChatCollectionViewCellID];
    collectionView.delegate   = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    self.collectionView = collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZRChatCollectionViewCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0)
                                           green:((float)arc4random_uniform(256) / 255.0)
                                            blue:((float)arc4random_uniform(256) / 255.0)
                                           alpha:1.0];//[UIColor yellowColor];
    
    return cell;
}

@end
