//
//  Main5_1ViewController.m
//  GuideTest
//
//  Created by tianqi on 16/7/7.
//  Copyright © 2016年 com.wiscess. All rights reserved.
//

#import "Main5_1ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface Main5_1ViewController ()
@property (nonatomic, strong) FirstViewController *firstVC;
@property (nonatomic, strong) SecondViewController *secondVC;
@property (nonatomic, strong) ThirdViewController *thirdVC;
@property (nonatomic, strong) UIViewController *currentVC;

@property (nonatomic, strong) UIScrollView *headScrollView;
@property (nonatomic, strong) NSMutableArray *itemArray;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation Main5_1ViewController

-(void)loadView{
    [super loadView];
    [self initialization];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
    
}

-(void)initialization{
    _itemArray=[NSMutableArray arrayWithObjects:@"头条",@"今日",@"焦点", nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)initUI{
    self.title=@"首页";
    CGFloat ScreenWidth=[UIScreen mainScreen].bounds.size.width;
    CGFloat BtnWidth=ScreenWidth/self.itemArray.count;
    _headScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth , 88)];
    _headScrollView.backgroundColor=[UIColor colorWithWhite:0.902 alpha:1.0];
    for (NSInteger i=0; i<self.itemArray.count; i++) {
        UIButton *itemButton=[[UIButton alloc] initWithFrame:CGRectMake(i*BtnWidth, 0, BtnWidth, 88)];
        itemButton.tag=100+i;
        itemButton.backgroundColor=[UIColor clearColor];
        NSDictionary *dic=@{NSForegroundColorAttributeName:[UIColor purpleColor],NSFontAttributeName:[UIFont systemFontOfSize:14.0f]};
        [itemButton setAttributedTitle:
        [[NSAttributedString alloc] initWithString:_itemArray[i] attributes:dic]
                              forState:UIControlStateNormal];
        [itemButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headScrollView addSubview:itemButton];
    }
    [_headScrollView setContentSize:CGSizeMake(ScreenWidth, 88)];
    _headScrollView.showsVerticalScrollIndicator=NO;
    _headScrollView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:_headScrollView];
    
    _contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 88, ScreenWidth, [UIScreen mainScreen].bounds.size.height-88)];
    _contentView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_contentView];
    [self addSubControllers];

}

-(void)addSubControllers{
    _firstVC=[[FirstViewController alloc] init];
    [self addChildViewController:_firstVC];
    
    _secondVC=[[SecondViewController alloc] init];
    [self addChildViewController:_secondVC];
    
    _thirdVC=[[ThirdViewController alloc] init];
    [self addChildViewController:_thirdVC];
    
    [self fitFrameForChildViewController:_firstVC];
    [self.contentView addSubview:_firstVC.view];
    _currentVC=_firstVC;
    
}

-(void)fitFrameForChildViewController:(UIViewController *)childVC{
    CGRect frame=self.contentView.frame;
    frame.origin.y=0;
    childVC.view.frame=frame;
}

-(void)buttonClick:(UIButton *)sender{
    if ((sender.tag==100 && _currentVC==_firstVC) && (sender.tag=101 && _currentVC==_secondVC)
        &&(sender.tag==102 && _currentVC==_thirdVC)) {
        return;
    }
    switch (sender.tag) {
        case 100:{
            [self fitFrameForChildViewController:_firstVC];
            [self transitionFromOldViewController:_currentVC toNewViewController:_firstVC];
        }
            break;
        case 101:{
            [self fitFrameForChildViewController:_secondVC];
            [self transitionFromOldViewController:_currentVC toNewViewController:_secondVC];
            }
            break;
        case 102:{
            [self fitFrameForChildViewController:_thirdVC];
            [self transitionFromOldViewController:_currentVC toNewViewController:_thirdVC];
            }
            break;
        default:
            break;
    }

}

-(void)transitionFromOldViewController:(UIViewController *)oldViewController
                   toNewViewController:(UIViewController *)newViewController{
    [self transitionFromViewController:oldViewController toViewController:newViewController duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished){
        if (finished) {
            [newViewController didMoveToParentViewController:self];
            _currentVC=newViewController;
        }else{
            _currentVC=oldViewController;
        }
    }];
}
@end
