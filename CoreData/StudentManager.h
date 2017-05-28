//
//  StudentManager.h
//  CoreData
//
//  Created by 敏捷软件 on 17/5/24.
//  Copyright © 2017年 xianminjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student+CoreDataProperties.h"
#import "User.h"
@interface StudentManager : NSObject

@property(nonatomic, strong) User *user;
+(id)shareInstance;

//添加数据
#if 0
-(Student *)insertData:(NSDictionary *)stu;
#else
-(Student *)insertData:(User *)user;
#endif

//删除数据
-(BOOL)deleteDataWithName:(NSString *)name;

//查找数据
-(Student *)qureyDataWithName:(NSString *)name;

//改动数据
-(BOOL)upadateDataWithNewData:(User *)newUser OldName:(NSString *)oldName;

//加载整个存储的数据源
-(NSArray *)loadAllData;
@end
