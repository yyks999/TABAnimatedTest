//
//  YKAppMenuGroupModel.h
//  iLiaoNing
//
//  Created by 杨翊楷 on 11/6/20.
//  Copyright © 2020 YK Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LNAppModel.h"

@interface YKAppMenuGroupModel : NSObject

@property (nonatomic, strong) NSString *gcode;        //分组code 1社交通讯 2沟通效率 3隐私安全 4其他
@property (nonatomic, strong) NSString *gcodename;    //分组名称
@property (nonatomic, strong) NSString *gcodeorder;   //分组排序

@property (nonatomic, strong) NSMutableArray <LNAppModel *> *appArray;

@end
