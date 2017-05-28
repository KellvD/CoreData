//
//  User.m
//  CoreData
//
//  Created by 敏捷软件 on 17/5/27.
//  Copyright © 2017年 xianminjie. All rights reserved.
//

#import "User.h"

@implementation User

/*
  User 可以作为一个数据模型model，如果不用user，我们在保存，查找，删除数据是对数据的传递只能以字典的方式进行，将数据的各个属性挨个保存在dictionary的相应键值中，然后再取出来
 user模型 可避免在传递过程中认为的遗漏数据的某个属性，应为user是以一个数据对象的整体来进行传递的
 #if X
        X=1时执行
 #else 
        X=0时执行
 #endif
 
 */
-(NSString *)name{
    if (!_name) {
        _name = @"";
    }
    return _name;
}

-(NSString *)age{
    if (!_age) {
        _age = @"";
    }
    return _age;
}

-(NSString *)phone{
    if (!_phone) {
        _phone = @"";
    }
    return _phone;
}
@end
