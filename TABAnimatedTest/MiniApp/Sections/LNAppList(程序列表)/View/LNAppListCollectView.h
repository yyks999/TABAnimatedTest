//
//  YKMineAppCollectionView.h
//  iLiaoNing
//
//  Created by 杨翊楷 on 3/25/19.
//  Copyright © 2019 YK Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LNAppModel;

@interface LNAppListCollectView : UICollectionView

@property (nonatomic, copy) void (^appClickBlock)(LNAppModel *model);

@property (nonatomic, strong) NSArray *dataArray;

@end
