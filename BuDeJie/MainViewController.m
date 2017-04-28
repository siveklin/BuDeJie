//
//  MainViewController.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/29.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "MainViewController.h"

#import "JinHuaViewController.h"
#import "XinTieViewController.h"
#import "FaBuViewController.h"
#import "GuanZhuViewController.h"
#import "WoDeViewController.h"



#import "BaseNavigationController.h"
#import "BlocksKit+UIKit.h"
#import <Toast/UIView+Toast.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:[self class], nil];
    
    
    NSMutableDictionary *fontSizeDict = [[NSMutableDictionary alloc] init];
    fontSizeDict[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:fontSizeDict forState:UIControlStateNormal];
    
    NSMutableDictionary *renderDict = [[NSMutableDictionary alloc] init];
    renderDict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:renderDict forState:UIControlStateSelected];

    self.viewControllers = [self getViewControllers];
    
    self.delegate = self;
    
    [self addTabBarTittleAndTabBarImage];

}
- (NSArray *)getViewControllers{
    
    JinHuaViewController *VC1 = [[JinHuaViewController alloc] initWithNibName:@"JinHuaViewController" bundle:nil];
//    VC1.title = @"精华";
    XinTieViewController *VC2 = [[XinTieViewController alloc] initWithNibName:@"XinTieViewController" bundle:nil];
//    VC2.title = @"新帖";

    FaBuViewController *VC3 = [[FaBuViewController alloc] initWithNibName:@"FaBuViewController" bundle:nil];
//    VC3.title = @"发布";

    GuanZhuViewController *VC4 = [[GuanZhuViewController alloc] initWithNibName:@"GuanZhuViewController" bundle:nil];
//    VC4.title = @"关注";

    WoDeViewController *VC5 = [[WoDeViewController alloc] initWithNibName:@"WoDeViewController" bundle:nil];
//    VC5.title = @"我的";


    BaseNavigationController *nav1 = [[BaseNavigationController alloc] initWithRootViewController:VC1];
    BaseNavigationController *nav2 = [[BaseNavigationController alloc] initWithRootViewController:VC2];
    BaseNavigationController *nav3 = [[BaseNavigationController alloc] initWithRootViewController:VC3];
    BaseNavigationController *nav4 = [[BaseNavigationController alloc] initWithRootViewController:VC4];
    BaseNavigationController *nav5 = [[BaseNavigationController alloc] initWithRootViewController:VC5];

    return @[nav1,nav2,nav3,nav4,nav5];
    
    
}

//添加TabBar图片和标题
-(void)addTabBarTittleAndTabBarImage{

    BaseNavigationController *jinHuaNAV = self.childViewControllers[0];
    jinHuaNAV.tabBarItem.title = @"精华";
    jinHuaNAV.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    jinHuaNAV.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_essence_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BaseNavigationController *xinTieNAV = self.childViewControllers[1];
    xinTieNAV.tabBarItem.title = @"新帖";
    xinTieNAV.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    xinTieNAV.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_new_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BaseNavigationController *faBuNAV = self.childViewControllers[2];
    faBuNAV.tabBarItem.title = @"发布";
    faBuNAV.tabBarItem.image = [UIImage imageNamed:@"tabBar_publish_icon"];
    faBuNAV.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_publish_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BaseNavigationController *guanZhuNAV = self.childViewControllers[3];
    guanZhuNAV.tabBarItem.title = @"关注";
    guanZhuNAV.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    guanZhuNAV.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BaseNavigationController *woDeNAV = self.childViewControllers[4];
    woDeNAV.tabBarItem.title = @"我的";
    woDeNAV.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    woDeNAV.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabBar_me_click_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];



}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    BaseNavigationController *temp = (BaseNavigationController*)viewController;
    
//    NSLog(@"%@",temp.childViewControllers[0]);
    if ([temp.viewControllers[0] isKindOfClass:FaBuViewController.class]) {
        
        [self.view makeToast:@"您点击了发布！"];
        
        return NO;
    }
    

    return YES;
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
