//
//  QLCInterFace.h
//  BuDeJie
//
//  Created by qiu on 2017/3/30.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
/**
 QXPLoadFailedBlock是连接过程中失败回调block
 */
typedef void (^QXPLoadFailedBlock)(NSError *error);
/**
 QXPLoadFinishBlock是连接过程成功并返回数据回调block
 */
typedef void (^QXPLoadFinishBlock)(id responseObje);

typedef id (^QXPLoadObjectBlock)(id responseObje);


//typedef id (^QLCLoadTagSubBlock)(id responseObje);



@interface QLCInterFace : NSObject
@property(nonatomic, strong)QXPLoadFinishBlock loadFinshBlock;//数据数据成功回调
@property(nonatomic, strong)QXPLoadFailedBlock loadFaildBlock;//获取数据失败回调
@property(nonatomic, strong)QXPLoadObjectBlock loadObject;//获取处理的后的对象datesource


//@property(nonatomic,strong)QLCLoadTagSubBlock loadTagSubObject;//获取标签订阅中推荐标签列表



@property(nonatomic, strong)NSString *netWorkType;//网络连接属性/POST/GET 使用 QLCWorkPOST 或 QLCWorkGET
@property(nonatomic, strong)NSString *urlString;//网络连接地址



+ (instancetype)interfaceWithFinshBlock:(QXPLoadFinishBlock)finshBlock
                             faildBlock:(QXPLoadFailedBlock)faildBlock
                      HUDBackgroundView:(UIView *)view;

#pragma -mark 不得姐登录接口
- (void)login:(NSString *)phone pwd:(NSString *)pwd;
#pragma -mark 注册
- (void)res:(NSString *)phone pwd:(NSString *)pwd;
#pragma -mark 获取启动广告
- (void)getAD;

#pragma -mark 获取我的界面图标
- (void)gettitleimage;

#pragma -mark 获取订阅图标
- (void)getSubTag;








@end
