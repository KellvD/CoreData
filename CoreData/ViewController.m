//
//  ViewController.m
//  CoreData
//
//  Created by 敏捷软件 on 17/5/24.
//  Copyright © 2017年 xianminjie. All rights reserved.
//

#import "ViewController.h"
#import "StudentManager.h"
#import "User.h"
#import "InfoViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@end

@implementation ViewController{
    NSMutableArray *_dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self initUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addInfo:) name:@"addinfo" object:nil];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadData];
    [self.tableView reloadData];
    
}
-(void)initUI{
    self.view.backgroundColor = [UIColor blueColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
-(void)reloadData{
    
    _dataArr = [NSMutableArray array];
    NSArray *stuArr = [[StudentManager shareInstance] loadAllData];
    [_dataArr addObjectsFromArray:stuArr];
}
- (void)addInfo:(NSNotification *)no
{
#if 0
    NSDictionary *obj = [no object];
#else
    User *obj = [no object];
#endif
    Student *stu = [[StudentManager shareInstance] insertData:obj];
    if (stu)
    {
        [_dataArr addObject:stu];
        [self.tableView reloadData];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 44)];
    [cell.contentView addSubview:nameLabel];
    
    UILabel *phonrLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 0, 300, 44)];
    [cell.contentView addSubview:phonrLabel];
    
    Student *student = _dataArr[indexPath.row];
    
    nameLabel.text = student.name;
    phonrLabel.text = student.phone;
    
    //cell简易的分割线
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 42, self.view.frame.size.width, 2)];
    view.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:view];
    
   
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    InfoViewController *infoVC = [[InfoViewController alloc]init];
    
    Student *student = _dataArr[indexPath.row];
    infoVC.stu = student;
    [self.navigationController pushViewController:infoVC animated:YES];
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Student *stu = _dataArr[indexPath.row];
        [[StudentManager shareInstance] deleteDataWithName:stu.name];
        [_dataArr removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
