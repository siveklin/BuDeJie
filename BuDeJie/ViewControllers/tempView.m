//
//  tempView.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/31.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "tempView.h"

@implementation tempView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            if ([self.delegate respondsToSelector:@selector(getSomethingFromtempView)]){
                
                [self.delegate getSomethingFromtempView];
              
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                self.tempBlock([UIColor orangeColor]);
                
            });
            
        });
    }

    return self;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
