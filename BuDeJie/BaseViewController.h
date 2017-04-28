//
//  BaseViewController.h
//  BuDeJie
//
//  Created by Qlinchao on 17/3/29.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


//登录
- (void)login:(void (^)(bool isLogin))loginBlock;
- (void)dismissVC: (BOOL)flag;
- (void)presentVC:(UIViewController *)viewControllerToPresent animated: (BOOL)flag;

@end
