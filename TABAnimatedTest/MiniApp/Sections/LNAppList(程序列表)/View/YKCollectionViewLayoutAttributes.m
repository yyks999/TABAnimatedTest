//
//  YKCollectionViewLayoutAttributes.m
//  iLiaoNing
//
//  Created by 杨翊楷 on 6/2/21.
//  Copyright © 2021 YK Yang. All rights reserved.
//

#import "YKCollectionViewLayoutAttributes.h"

@implementation YKCollectionViewLayoutAttributes

+ (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind
                                                                withIndexPath:(NSIndexPath *)indexPath {

    YKCollectionViewLayoutAttributes *layoutAttributes = [super layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    
    if (indexPath.section % 2 == 0) {
        layoutAttributes.color = [UIColor redColor];
    } else {
        layoutAttributes.color = [UIColor blueColor];
    }
    
    return layoutAttributes;
}

@end
