//
//  LNAppManager.h
//  iLiaoNing
//
//  Created by 杨翊楷 on 7/15/20.
//  Copyright © 2020 YK Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LNAppModel;
@class YKAppMoreMenuModel;

@interface LNAppManager : NSObject

#pragma mark - 获取小程序列表
+ (void)getCloudAppListComplete:(void (^)(NSArray *appArray))complete;

@end
