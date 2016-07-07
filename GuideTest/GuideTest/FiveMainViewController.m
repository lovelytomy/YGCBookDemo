//
//  FiveMainViewController.m
//  GuideTest
//
//  Created by tianqi on 16/7/7.
//  Copyright © 2016年 com.wiscess. All rights reserved.
//

#import "FiveMainViewController.h"
#import "LeftTableViewController.h"
#import "RightTableViewController.h"

@implementation FiveMainViewController{
    LeftTableViewController *leftVC;
    RightTableViewController *rightVC;
    
}
-(void)viewDidLoad{
    [super viewDidLoad];
    NSDictionary *menuDic=@{@"川菜":@[@"鱼香肉丝",@"宫保鸡丁",@"麻婆豆腐"],
              @"湘菜":@[@"剁椒鱼头",@"辣椒炒肉",@"湘西外婆菜"],
              @"粤菜":@[@"珍珠肉丸",@"菠萝咕咾肉",@"铁板鲳鱼"]};
//   leftVC=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LeftVC"];
//   rightVC=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RightVC"];
    for (UIViewController *vc in self.childViewControllers) {
        if ([vc isKindOfClass:[LeftTableViewController class]]) {
            leftVC=(LeftTableViewController *)vc;
        }else if([vc isKindOfClass:[RightTableViewController class]]){
            rightVC=(RightTableViewController *)vc;
        }
    }
    __weak RightTableViewController *right=rightVC;
    leftVC.callbackBlock=^(NSIndexPath *selectIndex,NSString *categoryName){
        right.titleArray=[menuDic objectForKey:categoryName];
        [right.tableView reloadData];
    };
}

@end
