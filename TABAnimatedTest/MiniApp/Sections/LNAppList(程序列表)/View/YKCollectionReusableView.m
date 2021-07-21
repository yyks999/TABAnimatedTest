//
//  YKCollectionReusableView.m
//  iLiaoNing
//
//  Created by 杨翊楷 on 6/2/21.
//  Copyright © 2021 YK Yang. All rights reserved.
//

#import "YKCollectionReusableView.h"
#import "YKCollectionViewLayoutAttributes.h"

@implementation YKCollectionReusableView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    
    //设置背景颜色
    YKCollectionViewLayoutAttributes *ykLayoutAttributes = (YKCollectionViewLayoutAttributes*)layoutAttributes;
    self.backgroundColor = ykLayoutAttributes.color;
}

@end
