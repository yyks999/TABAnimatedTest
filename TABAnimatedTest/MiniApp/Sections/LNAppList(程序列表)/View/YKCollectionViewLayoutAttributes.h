//
//  YKCollectionViewLayoutAttributes.h
//  iLiaoNing
//
//  Created by 杨翊楷 on 6/2/21.
//  Copyright © 2021 YK Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YKCollectionViewLayoutAttributes : UICollectionViewLayoutAttributes

@property (nonatomic, strong) UIColor *color;

+ (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind
                                                                withIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
