//
//  RightTableViewController.m
//  GuideTest
//
//  Created by tianqi on 16/7/7.
//  Copyright © 2016年 com.wiscess. All rights reserved.
//

#import "RightTableViewController.h"

@implementation RightTableViewController{
   
    
}
@synthesize titleArray;
-(void)viewDidLoad{
    [super viewDidLoad];
    titleArray = @[@"宫保鸡丁", @"北京烤鸭", @"糖醋里脊"];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier: @"right"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"right"];
    }
    cell.textLabel.text = titleArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titleArray.count;
}

@end
