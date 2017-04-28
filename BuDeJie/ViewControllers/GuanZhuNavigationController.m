//
//  GuanZhuNavigationController.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/31.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "GuanZhuNavigationController.h"

@interface GuanZhuNavigationController ()

@end

@implementation GuanZhuNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的关注";
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] forState:UIControlStateHighlighted];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    NSMutableDictionary *fontSizeDict = [[NSMutableDictionary alloc] init];
    fontSizeDict[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [self.navigationBar setTitleTextAttributes:fontSizeDict];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
