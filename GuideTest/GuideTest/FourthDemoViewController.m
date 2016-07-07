//
//  FourthDemoViewController.m
//  GuideTest
//
//  Created by tianqi on 16/7/6.
//  Copyright © 2016年 com.wiscess. All rights reserved.
//

#import "FourthDemoViewController.h"
#import "FourthTableViewCell.h"

@implementation FourthDemoViewController
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FourthTableViewCell *cell=(FourthTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"FourthTableViewCell"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}
@end
