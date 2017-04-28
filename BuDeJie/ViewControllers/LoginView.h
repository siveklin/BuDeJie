//
//  LoginView.h
//  BuDeJie
//
//  Created by Qlinchao on 17/3/30.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView
@property (weak, nonatomic) IBOutlet UITextField *textF_phone;
@property (weak, nonatomic) IBOutlet UITextField *textF_pwd;

//利用loginVBlock传用户名和密码
@property(nonatomic,strong)void (^loginVBlock)(NSString *phone,NSString* pwd);
+(instancetype)loadLoginView;
- (IBAction)login:(UIButton *)sender;

@end


@interface RegistView : UIView
+(instancetype)loadRegistView;
@end
