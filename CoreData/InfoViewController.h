//
//  InfoViewController.h
//  CoreData
//
//  Created by 敏捷软件 on 17/5/27.
//  Copyright © 2017年 xianminjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentManager.h"

@interface InfoViewController : UIViewController
@property (strong, nonatomic) UITextField *nameLabel;
@property (strong, nonatomic)  UITextField *agelabel;

@property (strong, nonatomic)  UITextField *phoneLabel;

@property(nonatomic, strong) Student *stu;
@end
