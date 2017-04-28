//
//  InterfaceModel.h
//  BuDeJie
//
//  Created by Qlinchao on 17/3/31.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>
#import <UIKit/UIKit.h>

@interface InterfaceModel : NSObject

@end

@interface MYList : InterfaceModel
@property(nonatomic,strong)NSString *android;
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *ipad;
@property(nonatomic,strong)NSString *iphone;
@property(nonatomic,strong)NSString *market;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *url;
@end

@interface SubTagList : InterfaceModel
@property(nonatomic,strong)NSString *image_list;
@property(nonatomic,strong)NSString *is_sub;
@property(nonatomic,strong)NSString *theme_name;
@property(nonatomic,strong)NSString *sub_number;

@end

@interface ADList : InterfaceModel

@property (nonatomic,strong) NSString *ori_curl;
@property (nonatomic,strong) NSString *w_picurl;
@property (nonatomic,assign) CGFloat w;
@property (nonatomic,assign) CGFloat h;

@end
