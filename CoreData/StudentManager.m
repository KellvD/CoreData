//
//  StudentManager.m
//  CoreData
//
//  Created by 敏捷软件 on 17/5/24.
//  Copyright © 2017年 xianminjie. All rights reserved.
//

#import "StudentManager.h"
#import "AppDelegate.h"
@implementation StudentManager

+(id)shareInstance{
    static StudentManager *studentManager;
    static dispatch_once_t onceTonken;
    dispatch_once(&onceTonken, ^{
        studentManager = [[StudentManager alloc]init];
        
    });
    return studentManager;
}
-(AppDelegate *)delegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#if 0
#pragma mark --- 添加数据  字典形式
-(Student *)insertData:(NSDictionary *)dict{
    NSError *error;
    NSManagedObjectContext *managerContext = [self delegate].persistentContainer.viewContext;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:managerContext];
    Student *yonger = [(Student *)[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:managerContext];
    
    NSLog(@"++++%@",dict);
    yonger.name = dict[@"name"];
    yonger.age = dict[@"age"] ;
    yonger.phone = dict[@"phone"];
    
    BOOL result = [[self delegate].persistentContainer.viewContext save:&error];
    if (result) {
        return yonger;
    }
    return nil;
}
#else
-(Student *)insertData:(User *)user{
    NSError *error;
    NSManagedObjectContext *managerContext = [self delegate].persistentContainer.viewContext;
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:managerContext];
    Student *yonger = [(Student *)[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:managerContext];
    
    NSLog(@"++++%@",user.name);
    yonger.name = user.name;
    yonger.age = user.age ;
    yonger.phone = user.phone;
    
    BOOL result = [[self delegate].persistentContainer.viewContext save:&error];
    if (result) {
        return yonger;
    }
    return nil;
}
#endif
-(NSArray *)loadAllData{
    //创建请求
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    //设置需要查询的实体对象
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[self delegate].persistentContainer.viewContext];
    //设置请求实体
    [request setEntity:entity];
    NSError *error = nil;
    NSArray *infos = [[[self delegate].persistentContainer.viewContext executeFetchRequest:request error:&error] mutableCopy];
    if (!error) {
        return infos;
    }
    return nil;
}

-(BOOL)deleteDataWithName:(NSString *)name{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@",name];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[self delegate].persistentContainer.viewContext];
    [request setEntity:entity];
    [request setPredicate:predicate];
    [request setFetchLimit:1];
    NSError *error = nil;
    NSArray *infos = [[[self delegate].persistentContainer.viewContext executeFetchRequest:request error:&error] mutableCopy];
    if (infos == nil) {
        return NO;
    }
    for (Student *stu in infos) {
        [[self delegate].persistentContainer.viewContext deleteObject:stu];
        [[self delegate].persistentContainer.viewContext save:&error];
    }
   
    return NO;
}

-(Student *)qureyDataWithName:(NSString *)name{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@",name];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[self delegate].persistentContainer.viewContext];
    [request setEntity:entity];
    [request setPredicate:predicate];
    [request setFetchLimit:1];
    NSError *error = nil;
    NSArray *infos = [[[self delegate].persistentContainer.viewContext executeFetchRequest:request error:&error] mutableCopy];
    if (infos == nil) {
        NSLog(@"查找不到");
        return nil;
    }
    for (Student *stu in infos) {
        
        return stu;
    }
    return nil;
}
-(BOOL)upadateDataWithNewData:(User *)newUser OldName:(NSString *)oldName{
    
    NSError *error;
    
    //先查找旧数据
    Student *oldstudent = [self qureyDataWithName:oldName];
    oldstudent.name = newUser.name;
    oldstudent.age = newUser.age;
    oldstudent.phone = newUser.phone;
    
    BOOL result = [[self delegate].persistentContainer.viewContext save:&error];
    if (result) {
        NSLog(@"更新成功");
        return YES;
    }
    NSLog(@"修改不成功");
    return NO;
    
}


@end
