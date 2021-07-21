//
//  LNAppListReusableView.m
//  iLiaoNing
//
//  Created by 杨翊楷 on 11/27/20.
//  Copyright © 2020 YK Yang. All rights reserved.
//

#import "LNAppListReusableView.h"

@implementation LNAppListReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 15, 80, 20)];
        _titleLab.textColor = [UIColor colorWithRed:0.63 green:0.65 blue:0.70 alpha:1.00];
        _titleLab.font = [UIFont systemFontOfSize:12];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_titleLab];
    }
    
    return self;
}

@end
