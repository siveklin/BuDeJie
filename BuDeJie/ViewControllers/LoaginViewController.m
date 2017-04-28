//
//  LoaginViewController.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/30.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "LoaginViewController.h"
#import "LoginView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <Toast/UIView+Toast.h>

@interface LoaginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *skipRegistBtn;
//@property (weak, nonatomic) IBOutlet UIView *middleView;

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@property(nonatomic, strong)LoginView *loginview;
@property(nonatomic, strong)RegistView *regview;


@end

@implementation LoaginViewController
- (IBAction)clickBackBtn:(id)sender {
    
    if (self.LoginVCBlock) {
        self.LoginVCBlock(NO);
    }
    
//    [self dismissVC:YES];
}
- (IBAction)skipRegist_click:(UIButton *)sender {
    
    if (self.scrollview.contentOffset.x == self.view.bounds.size.width) {
        [self.scrollview setContentOffset:CGPointMake(0, 0) animated:YES];
        [sender setTitle:@"现在注册" forState:UIControlStateNormal];
    }else{
    
        [self.scrollview setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:YES];
        [sender setTitle:@"已有账号?" forState:UIControlStateNormal];
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    LoginView *loginView = [ LoginView loadLoginView];
//    [self.middleView addSubview:loginView];
    
    self.regview = [RegistView loadRegistView];
    self.loginview = [LoginView loadLoginView];
    
    __weak LoaginViewController *wself= self;
    
    
    [self.loginview setLoginVBlock:^(NSString *phone, NSString *pwd) {
        
//        NSLog(@"LoginView的打印,输入框信息phone:%@  pwd:%@",phone,pwd);
        
        
        [[QLCInterFace interfaceWithFinshBlock:^(id responseObje) {
            
//            NSLog(@"LoginView的打印,网络返回值信息responseObje:%@",responseObje);
            
            if ([[responseObje objectForKey:@"msg"] isEqualToString:@"成功"]) {
                NSDictionary *info =[responseObje objectForKey:@"info"];
                [QLCUser shareUser].info = info;
                [[QLCUser shareUser] synchronize];
                
                if (wself.LoginVCBlock) {
                    wself.LoginVCBlock(YES);
                }
                
//                [wself dismissVC:YES];
                
            }else{
            
                [wself.view makeToast:[responseObje objectForKey:@"msg"]];
            }
                        
        } faildBlock:^(NSError *error) {
            NSLog(@"error:%@",error);
            
        } HUDBackgroundView:wself.view] login:phone pwd:pwd];       
        
    }];

    [self.scrollview addSubview:self.loginview];
    [self.scrollview addSubview:self.regview];
    self.scrollview.pagingEnabled = YES;
//    NSLog(@"111%@",NSStringFromCGRect(self.bottomView.frame) );
    
}
- (void)viewDidLayoutSubviews{

    [super viewDidLayoutSubviews];
    
    [self.scrollview setContentSize:CGSizeMake(self.view.bounds.size.width*2, self.regview.bounds.size.height)];

    
    self.loginview.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.loginview.bounds.size.height);
    
    self.regview.frame = CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.regview.bounds.size.height);
    
//    NSLog(@"222%@",NSStringFromCGRect(self.bottomView.frame) );

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
