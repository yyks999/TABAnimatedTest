//
//  LNAppListCollectView.m
//  iLiaoNing
//
//  Created by 杨翊楷 on 3/25/19.
//  Copyright © 2019 YK Yang. All rights reserved.
//

#import "LNAppListCollectView.h"
#import "LNAppCollectionCell.h"
#import "LNAppModel.h"
#import "YKAppMenuGroupModel.h"
#import "LNAppListReusableView.h"

#import "TABAnimated.h"     //骨架屏

@interface LNAppListCollectView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation LNAppListCollectView

static NSString * const reuseIdentifier = @"LNAppCollectionCellID";
static NSString * const headerReuseIdentifier = @"LNAppListReusableView";

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 35);  //设置headerView大小
    flowLayout.footerReferenceSize = CGSizeMake(0, 0);  // 设置footerView大小
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"LNAppCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
        
        [self registerClass:[LNAppListReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerReuseIdentifier];
        
        

        //骨架屏动画
        self.tabAnimated =
        [TABCollectionAnimated animatedWithCellClass:[LNAppCollectionCell class]
                                            cellSize:[LNAppCollectionCell cellSize]];
        // 如果不希望灰色背景，可以设置黑色（和背景相同的颜色，别设置透明色）
        if (@available(iOS 13.0, *)) {
            self.tabAnimated.darkAnimatedBackgroundColor = UIColor.systemBackgroundColor;
        }
        self.tabAnimated.animatedCount = 10;
        self.tabAnimated.animatedSectionCount = 2;
        self.tabAnimated.superAnimationType = TABViewSuperAnimationTypeShimmer;

        // 添加区头动画，UICollectionReusableView类型, 同时支持普通的UIView
        [self.tabAnimated addHeaderViewClass:[LNAppListReusableView class] viewSize:CGSizeMake(SCREEN_WIDTH, 35)];
        self.tabAnimated.adjustWithClassBlock = ^(TABComponentManager * _Nonnull manager, Class  _Nonnull __unsafe_unretained targetClass) {
            if (targetClass == [LNAppListReusableView class]) {
                manager.animation(0).height(15).down(0).reducedWidth(0);
            }
        };
         
    }
    return self;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    YKAppMenuGroupModel *groupModel = _dataArray[section];
    return groupModel.appArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LNAppCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    YKAppMenuGroupModel *groupModel = _dataArray[indexPath.section];
    LNAppModel *model = groupModel.appArray[indexPath.row];
    
    cell.appImage.image = [UIImage imageNamed:model.drawericon];
    cell.appNameLabel.text = model.drawername;
    
    cell.redTipView.hidden = YES;
   
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH / 5, 77);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LNAppCollectionCell *cell = (LNAppCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.redTipView.hidden = YES;
    
    YKAppMenuGroupModel *groupModel = _dataArray[indexPath.section];
    LNAppModel *model = groupModel.appArray[indexPath.row];
    
    if(_appClickBlock) {
        _appClickBlock(model);
    }
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}

#pragma mark - UICollectionViewCell高亮

// 高亮时调用
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0.91 green:0.95 blue:1.00 alpha:1.00];
}

// 高亮结束调用
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}

// 是否可以高亮
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

#pragma mark - UICollectionView sectionHeader

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    YKAppMenuGroupModel *groupModel = _dataArray[indexPath.section];
    
    LNAppListReusableView *header =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:headerReuseIdentifier                                 forIndexPath:indexPath];
    header.titleLab.text = groupModel.gcodename;
    return header;
}

@end
