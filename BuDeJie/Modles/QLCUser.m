//
//  QLCUser.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/30.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "QLCUser.h"

static QLCUser *_instance;

@implementation QLCUser
+(instancetype)shareUser
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[QLCUser alloc] init];
            
            _instance.info =[[NSUserDefaults standardUserDefaults] objectForKey:@"QLCUser"];
            _instance.userName = [_instance.info objectForKey:@"username"];
            
            _instance.profile_image_large = [_instance.info objectForKey:@"profile_image_large"];


        }
    });
    return _instance;
}
- (void)synchronize{

    [[NSUserDefaults standardUserDefaults] setObject:self.info forKey:@"QLCUser"];
    
    self.userName =  [self.info objectForKey:@"username"];
    self.profile_image_large = [self.info objectForKey:@"profile_image_large"];

}
- (BOOL)exit{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"QLCUser"];
    
    self.userName =nil;
    self.profile_image_large =nil;
    
    
    
    self.info=nil;
    
    return YES;
}
- (BOOL)isLogin{

    if (self.info) {
        return YES;
    }
    return NO;
}
@end
