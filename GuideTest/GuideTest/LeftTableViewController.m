//
//  LeftTableViewController.m
//  GuideTest
//
//  Created by tianqi on 16/7/7.
//  Copyright © 2016年 com.wiscess. All rights reserved.
//

#import "LeftTableViewController.h"

@implementation LeftTableViewController{
    NSArray *titleArray;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    titleArray=@[@"川菜",@"湘菜",@"粤菜"];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"identifier"];
    }
    cell.textLabel.text=titleArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.callbackBlock) {
        NSLog(@"右边的tableview请刷新");
        self.callbackBlock(indexPath,titleArray[indexPath.row]);
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titleArray.count;
}

@end
