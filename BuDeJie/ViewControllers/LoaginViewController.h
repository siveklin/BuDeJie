//
//  LoaginViewController.h
//  BuDeJie
//
//  Created by Qlinchao on 17/3/30.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "BaseViewController.h"

@interface LoaginViewController : BaseViewController
@property(nonatomic,strong)void (^LoginVCBlock)(bool isLogin);
@end
