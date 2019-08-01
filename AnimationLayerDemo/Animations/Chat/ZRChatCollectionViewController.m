//
//  ZRChatCollectionViewController.m
//  AnimationLayerDemo
//
//  Created by Hesland on 2019/7/30.
//  Copyright © 2019 ZRTools. All rights reserved.
//

#import "ZRChatCollectionViewController.h"

#define ZRMinimumLineSpacing 10
#define ZRminimumInteritemSpacing 5

@interface ZRScaleFlowLayout : UICollectionViewFlowLayout

@end

@implementation ZRScaleFlowLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(SCREEN_WIDTH * 0.7, SCREEN_HEIGHT - 20);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = ZRMinimumLineSpacing;
        self.minimumInteritemSpacing = ZRminimumInteritemSpacing;
    }
    return self;
}

//- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
//    NSMutableArray * attributes = [[NSMutableArray alloc] init];
//    //遍历设置每个item的布局属性
//    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
//        [attributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
//    }
//    return attributes;
//}
//
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    //创建一个item布局属性类
    UICollectionViewLayoutAttributes *atti = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //获取item的个数
    int itemCounts = (int)[self.collectionView numberOfItemsInSection:0];
    //设置每个item的大小为260*100

    atti.size = CGSizeMake(self.collectionView.frame.size.width * 0.7, self.collectionView.frame.size.height - 20);
    atti.center = CGPointMake(self.collectionView.frame.size.width/2, self.collectionView.frame.size.height/2);
    //创建一个transform3D类
    //CATransform3D是一个类似矩阵的结构体
    //CATransform3DIdentity创建空得矩阵
    CATransform3D trans3D = CATransform3DIdentity;
    //这个值设置的是透视度，影响视觉离投影平面的距离
//    trans3D.m34 = -1/900.0;
    //下面这些属性 后面会具体介绍
    //这个是3D滚轮的半径
    CGFloat radius = 50/tanf(M_PI*2/itemCounts/2);
    //计算每个item应该旋转的角度
    CGFloat angle = (float)(indexPath.row)/itemCounts*M_PI*2;
    //这个方法返回一个新的CATransform3D对象，在原来的基础上进行旋转效果的追加
    //第一个参数为旋转的弧度，后三个分别对应x，y，z轴，我们需要以x轴进行旋转
//    trans3D = CATransform3DRotate(trans3D, angle, 0, 1.0, 0);
//    trans3D = CATransform3DTranslate(trans3D, 0, 0, radius);
    trans3D = CATransform3DScale(trans3D, 1.2, 1.2, 1);
    //进行设置
    atti.transform3D = trans3D;
    /*
     后边介绍的代码添加在这里

     */
    return atti;
}

@end

#define ZRChatCollectionViewCellID  @"ZRChatCollectionViewCellID"

#warning mark - 先完成轮播效果，再逐一修改 Transform3D 的效果，
#warning mark - 完成过动画之后再考虑享元模式VC池设计
@interface ZRChatCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) ZRScaleFlowLayout *layout;
@property (nonatomic, assign) NSUInteger currentPage;


@end

@implementation ZRChatCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    ZRScaleFlowLayout *layout = [[ZRScaleFlowLayout alloc] init];
    self.layout = layout;
    
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
                                           alpha:1.0];
    
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    //1. 计算滚动一页的偏移量。  第一个cell因为有contentInset影响，所以和后面每滚动一页有一个contentInset的区别
//    
//    
//    //2. 此处判断是否需要改变页数
//    if (fabs(velocity.x) <= 0.3) {
//        CGFloat currentOffsetX = scrollView.contentOffset.x;
//        self.currentPage = (currentOffsetX - firstCellOffset) / otherCellOffsetX+1+0.5;
//    }else{
//        if (velocity.x > 0) {
//            self.currentPage ++;
//        }else{
//            self.currentPage --;
//        }
//    }
//    
//    //3.  如果，当然只是如果，一般来说只要虚拟个数设置过大，基本不可能滚动到头；若真到头了就只好重置currentPage的值喽
//    
//    
//    //4. 根据页数计算偏移量
//    CGFloat offsetX;
//    if (self.currentPage == 0) {
//        offsetX = firstCellOffset;
//    }else{
//        offsetX = firstCellOffset + otherCellOffsetX * (self.currentPage-1);
//    }
    
    //5. 设置scrollView滚动的最终停止位置
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

@end
