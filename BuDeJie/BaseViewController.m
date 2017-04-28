//
//  BaseViewController.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/29.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "BaseViewController.h"
#import "LoaginViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)login:(void (^)(bool isLogin))loginBlock{
    
    LoaginViewController *loginVC = [[LoaginViewController alloc] initWithNibName:@"LoaginViewController" bundle:nil];
    
    __weak LoaginViewController *weakLoginVC = loginVC;
    
    [loginVC setLoginVCBlock:^(bool islogin) {
        
        [weakLoginVC dismissVC:YES ];
        
        loginBlock(islogin);
    }];
    
//    [loginVC setLoginVCBlock:loginBlock];
    
    [self presentVC:loginVC animated:YES];

}


- (void)presentVC:(UIViewController *)viewControllerToPresent animated: (BOOL)flag{

    [self presentViewController:viewControllerToPresent animated:flag completion:nil];

}
- (void)dismissVC: (BOOL)flag{
    
    [self dismissViewControllerAnimated:flag completion:nil];
    
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
