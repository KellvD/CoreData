//
//  AddViewController.m
//  CoreData
//
//  Created by 敏捷软件 on 17/5/24.
//  Copyright © 2017年 xianminjie. All rights reserved.
//

#import "AddViewController.h"
#import "StudentManager.h"
#import "User.h"
@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)addData:(id)sender {
    
    
    NSString *name = self.nameLabel.text;
    NSString *age = self.agelabel.text;
    NSString *phone =self.phoneLabel.text;
#if 0 //按照字典将对象的信息逐个添加保存
    if (name.length >0) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"name"] = name;
        dict[@"age"] = age;
        dict[@"phone"] = phone;
        [[NSNotificationCenter defaultCenter]postNotificationName:@"addinfo" object:dict];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        NSLog(@"请输入姓名");
    }
#else  //以对象来保存
     User *astu = [[User alloc]init];
    if (name.length >0) {
        
        [astu setName:name];
        [astu setAge:age];
        [astu setPhone:phone];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"addinfo" object:astu];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        NSLog(@"请输入姓名");
    }
#endif
}




- (IBAction)addDataContinue:(id)sender {
    
    
    NSString *name = self.nameLabel.text;
    NSString *age = self.agelabel.text;
    NSString *phone =self.phoneLabel.text;
#if 0
    if (name.length >0) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"name"] = name;
        dict[@"age"] = age;
        dict[@"phone"] = phone;
        [[NSNotificationCenter defaultCenter]postNotificationName:@"addinfo" object:dict];
        self.nameLabel.text = @"";
        self.agelabel.text = @"";
        self.phoneLabel.text = @"";
        
    }else{
        NSLog(@"请输入姓名");
    }
#else
    User *astu = [[User alloc]init];
    if (name.length >0) {
        astu.name = name;
        astu.age = age;
        astu.phone = phone;
        [[NSNotificationCenter defaultCenter]postNotificationName:@"addinfo" object:astu];
        self.nameLabel.text = @"";
        self.agelabel.text = @"";
        self.phoneLabel.text = @"";
    }else{
        NSLog(@"请输入姓名");
    }
    
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
