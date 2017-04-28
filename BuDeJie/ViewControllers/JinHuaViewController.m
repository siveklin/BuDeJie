//
//  JinHuaViewController.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/29.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "JinHuaViewController.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import "tempView.h"
#import "InterfaceModel.h"
@interface JinHuaViewController ()<tempViewDelegate>

@property (nonatomic,strong) tempView *tempView;

@end

@implementation JinHuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"精华";
    
    _tempView =[[tempView alloc] initWithFrame:CGRectMake(0, 80, 300, 300)];
    _tempView.backgroundColor = [UIColor redColor];
    _tempView.delegate = self;
    [self.view addSubview:_tempView];
    
    __weak tempView *weakTempView = _tempView;
    _tempView.tempBlock = ^(UIColor *cor){
        weakTempView.backgroundColor = cor;
    };
    
   
    
}

-(void)getSomethingFromtempView{
    _tempView.backgroundColor = [UIColor blueColor];
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
