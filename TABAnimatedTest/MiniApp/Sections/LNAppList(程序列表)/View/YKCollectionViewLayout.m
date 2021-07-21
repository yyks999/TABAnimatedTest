//
//  YKCollectionViewLayout.m
//  iLiaoNing
//
//  Created by 杨翊楷 on 6/2/21.
//  Copyright © 2021 YK Yang. All rights reserved.
//

#import "YKCollectionViewLayout.h"
#import "YKCollectionViewLayoutAttributes.h"
#import "YKCollectionReusableView.h"

static NSString *kDecorationReuseIdentifier = @"section_background";
static NSString *kCellReuseIdentifier = @"view_cell";

@implementation YKCollectionViewLayout

+ (Class)layoutAttributesClass
{
    return [YKCollectionViewLayoutAttributes class];
}

- (void)prepareLayout {
    [super prepareLayout];

    self.minimumLineSpacing = 8.0f;
    self.minimumInteritemSpacing = 8.0f;
    self.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
    self.itemSize = CGSizeMake(148.0f, 115.0f);

    [self registerClass:[YKCollectionReusableView class] forDecorationViewOfKind:kDecorationReuseIdentifier];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];

    NSMutableArray *allAttributes = [NSMutableArray arrayWithArray:attributes];

    for (UICollectionViewLayoutAttributes *attribute in attributes) {

        // 查找一行的第一个item
        if (attribute.representedElementKind == UICollectionElementCategoryCell
            && attribute.frame.origin.x == self.sectionInset.left) {

            // 创建decoration属性、
            YKCollectionViewLayoutAttributes *decorationAttributes =
            [YKCollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:kDecorationReuseIdentifier
                                                                        withIndexPath:attribute.indexPath];

            // 让decoration view占据整行
            decorationAttributes.frame =
            CGRectMake(0,
                       attribute.frame.origin.y-(self.sectionInset.top),
                       self.collectionViewContentSize.width,
                       self.itemSize.height+(self.minimumLineSpacing+self.sectionInset.top+self.sectionInset.bottom));

            // 设置zIndex，表示在item的后面
            decorationAttributes.zIndex = attribute.zIndex-1;

            // 添加属性到集合
            [allAttributes addObject:decorationAttributes];
        }
    }
    
    return allAttributes;
}

@end
