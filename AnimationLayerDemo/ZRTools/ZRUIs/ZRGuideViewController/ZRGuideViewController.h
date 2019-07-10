//
//  ZRGuideViewController.h
//  ZRTools
//
//  Created by Hesland on 2018/8/25.
//  Copyright © 2018年 ZRTools. All rights reserved.
//

#import "ZRBaseViewController.h"

@interface ZRGuideViewController : ZRBaseViewController

typedef void (^GuideVCFinshBLock)(void);

@property (nonatomic, assign, getter = getIndex) NSInteger index;
@property (copy) GuideVCFinshBLock                         block;

@end
