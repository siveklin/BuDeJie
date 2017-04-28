//
//  XinTieViewController.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/29.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "XinTieViewController.h"
#import "TagSubViewController.h"

@interface XinTieViewController ()

@end

@implementation XinTieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"新帖";

    UIButton *tagSubBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tagSubBtn setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [tagSubBtn setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    
    [tagSubBtn sizeToFit];
    [tagSubBtn addTarget:self action:@selector(didTagSubBtn) forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:tagSubBtn.bounds];
    [view addSubview:tagSubBtn];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
}

- (void)didTagSubBtn{
    TagSubViewController *tagSubVC = [[TagSubViewController alloc] init];
    [self.navigationController pushViewController:tagSubVC animated:YES];
    
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
