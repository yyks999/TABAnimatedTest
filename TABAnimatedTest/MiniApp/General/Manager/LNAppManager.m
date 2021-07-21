//
//  LNAppManager.m
//  iLiaoNing
//
//  Created by 杨翊楷 on 7/15/20.
//  Copyright © 2020 YK Yang. All rights reserved.
//

#import "LNAppManager.h"
#import "LNAppModel.h"
#import "YKAppMenuGroupModel.h"

@implementation LNAppManager

#pragma mark - 获取小程序列表

+ (void)getCloudAppListComplete:(void (^)(NSArray *appArray))complete {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MiniAppData" ofType:@"plist"];
    NSArray *resultArr = [NSArray arrayWithContentsOfFile:path];
    
    //1.将dic转为model数据源，并根据业务订购情况筛除不需显示的小程序
    NSMutableArray *groupArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary *groupDic in resultArr) {
        
        YKAppMenuGroupModel *groupmodel = [[YKAppMenuGroupModel alloc] init];
        groupmodel.gcode = groupDic[@"gcode"];
        groupmodel.gcodename = groupDic[@"gcodename"];
        groupmodel.gcodeorder = groupDic[@"gcodeorder"];
        groupmodel.appArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        NSArray *drawerList = groupDic[@"drawerlist"];
        NSMutableArray *modelArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        
        for (NSDictionary *drawerDic in drawerList) {
            LNAppModel *appModel = [[LNAppModel alloc] init];
            appModel.drawericon = drawerDic[@"drawericon"];
            appModel.drawername = drawerDic[@"drawername"];
            
            [modelArray addObject:appModel];
        }
        
        for (LNAppModel *appModel in modelArray) {
            [groupmodel.appArray addObject:appModel];
        }
        
        if(groupmodel.appArray.count > 0) {
            [groupArray addObject:groupmodel];
        }
    }
    
    //8.根据序号将小程序组升序排序
    NSSortDescriptor *groupSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"gcodeorder" ascending:YES selector:@selector(localizedStandardCompare:)];
    NSArray *groupSortResultArr = [groupArray sortedArrayUsingDescriptors:[NSArray arrayWithObjects:groupSortDescriptor, nil]];
    
    if(complete) {
        complete(groupSortResultArr);
    }
}

@end
