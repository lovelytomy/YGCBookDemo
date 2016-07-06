//
//  SecondDemoViewController.m
//  GuideTest
//
//  Created by tianqi on 16/7/6.
//  Copyright © 2016年 com.wiscess. All rights reserved.
//

#import "SecondDemoViewController.h"
#import "CustomTableViewCell.h"

@implementation SecondDemoViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomTableViewCell *cell=(CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"customCell"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 155;//155;//100;//300
}
@end
