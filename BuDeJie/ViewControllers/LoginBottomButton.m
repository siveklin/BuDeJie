//
//  LoginBottomButton.m
//  BuDeJie
//
//  Created by Qlinchao on 17/4/3.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "LoginBottomButton.h"

@implementation LoginBottomButton

-(void)layoutSubviews{
    
    [super layoutSubviews];
    CGRect tempImageFrame =  self.imageView.frame;
    tempImageFrame.origin.y = 0;
    self.imageView.frame = tempImageFrame;
    
    CGPoint tempImagePoint = self.imageView.center;
    tempImagePoint.x = self.bounds.size.width/2;
    self.imageView.center = tempImagePoint;
    
    CGRect tempLabelFrame =  self.titleLabel.frame;
    tempLabelFrame.origin.y = self.bounds.size.height - tempLabelFrame.size.height ;
    
    self.titleLabel.frame = tempLabelFrame;
    
    CGPoint tempLabelPoint = self.titleLabel.center;
    [self.titleLabel sizeToFit];
    tempLabelPoint.x = self.bounds.size.width/2;
    self.titleLabel.center = tempLabelPoint;
    
    
//    NSLog(@"X值:%fY值:%f---%@>>>>---%@",self.center.x,self.center.y,NSStringFromCGRect(self.superview.superview.frame),self.superview.superview);
    
    
}

@end
