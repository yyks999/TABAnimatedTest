//
//  LNAppCollectionCell.m
//  ScrollMenuDemo
//
//  Created by 杨翊楷 on 7/14/20.
//  Copyright © 2020 YK Yang. All rights reserved.
//

#import "LNAppCollectionCell.h"

@implementation LNAppCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

+ (CGSize)cellSize {
    return CGSizeMake(SCREEN_WIDTH / 5, 77);
}

@end
