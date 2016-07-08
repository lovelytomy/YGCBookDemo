//
//  SevenViewController.h
//  GuideTest
//
//  Created by tianqi on 16/7/8.
//  Copyright © 2016年 com.wiscess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SevenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIStackView *ImageStackView;
- (IBAction)addImage:(id)sender;
- (IBAction)deleteImage:(id)sender;

@end
