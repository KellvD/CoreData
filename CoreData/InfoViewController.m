//
//  InfoViewController.m
//  CoreData
//
//  Created by 敏捷软件 on 17/5/27.
//  Copyright © 2017年 xianminjie. All rights reserved.
//

#import "InfoViewController.h"
#import "StudentManager.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"coredata 查改";
    [self initUI];
    
    
    self.nameLabel.text = self.stu.name;
    self.agelabel.text = self.stu.age;
    self.phoneLabel.text = self.stu.phone;
    
}



-(void)initUI{
    self.view.backgroundColor = [UIColor colorWithRed:0.11 green:0.81 blue:0.83 alpha:1.0];
    
    NSArray *titleArr = @[@"姓名",@"年龄",@"电话"];
    
    for (int i=0; i<3; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 100+50*i, 100, 30)];
        label.text = titleArr[i];
        [self.view addSubview: label];
        
        UITextField *tv = [[UITextField alloc]initWithFrame:CGRectMake(150, 100+50*i, 200, 30)];
        tv.tag = i+1;
        [self.view addSubview:tv];
        tv.layer.borderWidth = 1;
       
    }
    self.nameLabel = (UITextField *)[self.view viewWithTag:1];
    self.agelabel = (UITextField *)[self.view viewWithTag:2];
    self.phoneLabel = (UITextField *)[self.view viewWithTag:3];
    
    
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(self.view.frame.size.width/2-75, 400, 150, 40);
    [button setTitle:@"确认修改" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
}
-(void)buttonClick{
    
    User *newuser = [[User alloc]init];
    newuser.name = self.nameLabel.text;
    newuser.age = self.agelabel.text;
    newuser.phone = self.phoneLabel.text;
    
    [[StudentManager shareInstance] upadateDataWithNewData:newuser OldName:self.stu.name];
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.nameLabel.text = @"";
    self.agelabel.text = @"";
    self.phoneLabel.text = @"";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeInfoClick:(id)sender {
    
    
}


@end
