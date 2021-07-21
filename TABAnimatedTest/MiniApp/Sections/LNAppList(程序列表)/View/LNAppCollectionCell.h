//
//  LNAppCollectionCell.h
//  ScrollMenuDemo
//
//  Created by 杨翊楷 on 7/14/20.
//  Copyright © 2020 YK Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LNAppCollectionCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView *appImage;
@property (nonatomic, strong) IBOutlet UILabel *appNameLabel;
@property (nonatomic, strong) IBOutlet UILabel *redTipView;

@property (nonatomic, strong) IBOutlet UIView *topLineView;
@property (nonatomic, strong) IBOutlet UIView *leftLineView;
@property (nonatomic, strong) IBOutlet UIView *bottomLineView;
@property (nonatomic, strong) IBOutlet UIView *rightLineView;

+ (CGSize)cellSize;

@end
