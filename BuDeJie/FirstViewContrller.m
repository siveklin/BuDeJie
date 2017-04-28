//
//  FirstViewContrller.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/29.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "FirstViewContrller.h"
#import "MainViewController.h"
#import <Toast/UIView+Toast.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface FirstViewContrller ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImage;
@property (weak, nonatomic) IBOutlet UIView *adView;
@property (weak, nonatomic) IBOutlet UIButton *skipBtn;
@property (nonatomic ,strong) UIImageView *adImageView;
@property (nonatomic,weak) NSTimer *timer;
@property (nonatomic,strong) ADList *adList;



@end

@implementation FirstViewContrller


//-(UIImageView *)adImageView{
//    if (_adImageView == nil) {
//        _adImageView = [[UIImageView alloc] init];
//        [self.adView addSubview:_adImageView];
//    }
//    return _adImageView;
//}

- (IBAction)skipBtn:(id)sender {
    
    MainViewController *mainVC=[[MainViewController alloc] init];
    [self presentVC:mainVC animated:YES];
    [self.timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.adImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(forTimer) userInfo:nil repeats:YES];
    
    [self.view makeToast:@"3秒后跳转"];
    
    [[QLCInterFace interfaceWithFinshBlock:^(id responseObje) {
        
        _adList = responseObje;

        CGFloat height = [UIScreen mainScreen].bounds.size.width / _adList.w * _adList.h;
        self.adImageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height);
        
        [self.adImageView sd_setImageWithURL:[NSURL URLWithString:_adList.w_picurl]];
        NSLog(@"广告界面Frame打印:%@",self.adImageView);
        [self.adView addSubview:self.adImageView];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSafari)];
        self.adImageView.userInteractionEnabled = YES;
        [self.adImageView addGestureRecognizer:tapGes];
        
    } faildBlock:^(NSError *error) {
        
    } HUDBackgroundView:self.view] getAD];
    
  
}

-(void)tapSafari{
    NSURL *url = [NSURL URLWithString:_adList.ori_curl];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }

}

-(void)forTimer{
    
    static int i = 3;
    
    if (i == 1) {
        
        [self skipBtn:nil];
        
        return;
    }
    
    i --;
    
    [self.skipBtn setTitle:[NSString stringWithFormat:@"跳转 (%d)",i] forState:UIControlStateNormal];
    NSLog(@"%@",[NSString stringWithFormat:@"跳转 (%d)",i]);
    
    
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
