//
//  QLCUser.h
//  BuDeJie
//
//  Created by Qlinchao on 17/3/30.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLCUser : NSObject
//用户信息
@property(nonatomic,strong)NSDictionary *info;

@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *profile_image_large;



+(instancetype)shareUser;

- (void)synchronize;
- (BOOL)exit;


- (BOOL)isLogin;

@end
