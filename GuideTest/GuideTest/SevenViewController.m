//
//  SevenViewController.m
//  GuideTest
//
//  Created by tianqi on 16/7/8.
//  Copyright © 2016年 com.wiscess. All rights reserved.
//

#import "SevenViewController.h"

@interface SevenViewController ()

@end

@implementation SevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addImage:(id)sender {
    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wuyanzuvatar.jpg"]];
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    [self.ImageStackView addArrangedSubview:imageView];
    [UIView animateWithDuration:0.25 animations:^{
        [self.ImageStackView layoutIfNeeded];
    }];
}

- (IBAction)deleteImage:(id)sender {
    UIImageView *imageView=[self.ImageStackView.arrangedSubviews lastObject];
    if (imageView) {
        [self.ImageStackView removeArrangedSubview:imageView];
        [imageView removeFromSuperview];
        [UIView animateWithDuration:0.25 animations:^{
            [self.ImageStackView layoutIfNeeded];
        }];
    }
}
@end
