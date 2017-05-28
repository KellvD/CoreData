//
//  Student+CoreDataProperties.m
//  CoreData
//
//  Created by 敏捷软件 on 17/5/24.
//  Copyright © 2017年 xianminjie. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic age;
@dynamic phone;
@dynamic name;
@dynamic love;

@end
