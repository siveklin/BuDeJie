//
//  QLCInterFace.m
//  BuDeJie
//
//  Created by qiu on 2017/3/30.
//  Copyright © 2017年 JAYA. All rights reserved.
//


#import "QLCInterFace.h"
#import "MBProgressHUD.h"


//@interface QLCInterFaceMain : NSObject
//@property(nonatomic, strong)NSMutableArray *interfaceArr;
//@end
//@implementation QLCInterFaceMain
//static QLCInterFaceMain *_instance;
//
//+(instancetype)share
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        if (_instance == nil) {
//            _instance = [[QLCInterFaceMain alloc] init];
//            _instance.interfaceArr = [NSMutableArray array];
//        }
//    });
//    return _instance;
//}
//@end
//返回处理后的对象


#define code @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

NSString *const QLCWorkPOST = @"POST";
NSString *const QLCWorkGET = @"GET";

@interface QLCInterFace ()
@property(nonatomic, strong)MBProgressHUD  *MBHUDView;
@property(nonatomic,assign)UIView *HUDBackgroundView;


@end

@implementation QLCInterFace


#pragma -mark 不得姐登录接口
- (void)login:(NSString *)phone pwd:(NSString *)pwd{
    
    self.urlString = @"https://api.budejie.com/api/api_open.php";
    
    
    NSDictionary *temp =@{@"a":@"login",
                          @"appname":@"bs0517",
                          @"asid":@"E7909CBA-7D0B-4B70-898E-3ECF2EC34979",
                          @"c":@"user",
                          @"client":@"iphone",
                          @"countrycode":@"86",
                          @"device":@"ios device",
                          @"from":@"ios",
                          @"jbk":@"0",
                          @"openudid":@"e5c64f296927f57b55a283afaa6f344405d23d0e",
                          @"ver":@"4.3",
                          };
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:temp];


    //[dict setObject:@"18616113386" forKey:@"phonenum"];
    //[dict setObject:@"yPkCTOTFGLtzTj6okr04lQ==" forKey:@"password"];
//     [self starLoadInformationWithParameters:dict URLString:self.urlString connectType:QLCWorkGET];
    
    
    [dict setObject:phone forKey:@"phonenum"];
    [dict setObject:pwd forKey:@"password"];

	
    [self starLoadInformationWithParameters:dict URLString:self.urlString connectType:QLCWorkPOST];
}
#pragma -mark 注册
- (void)res:(NSString *)phone pwd:(NSString *)pwd{

    self.urlString = @"https://d.api.budejie.com/user/api/login";
    
    NSDictionary *temp =@{@"a":@"login",
                          @"appname":@"bs0315",
                          @"asid":@"00000000-0000-0000-0000-000000000000",
                          @"c":@"user",
                          @"client":@"iphone",
                          @"countrycode":@"86",
                          @"device":@"ios device",
                          @"from":@"ios",
                          @"jbk":@"0",
                          @"openudid":@"916bef0b3694f930eb8cad9bf69ee65d54ac6e42",
                          @"ver":@"4.5.5",
                          @"hash":@"0ab0",
                          @"t":@"1490877202",
                          };
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:temp];
    
    //[dict setObject:@"18616113386" forKey:@"phonenum"];
    //[dict setObject:@"yPkCTOTFGLtzTj6okr04lQ==" forKey:@"password"];
    
    [dict setObject:phone forKey:@"phonenum"];
    [dict setObject:pwd forKey:@"password"];
    
    
    [self starLoadInformationWithParameters:dict URLString:self.urlString connectType:QLCWorkGET];

}

#pragma -mark 获取广告
- (void)getAD{
    [self setLoadObject:^id(id object){
       ADList *adList = [ADList mj_objectWithKeyValues:[object[@"ad"] lastObject]];
        return adList;
    }
     ];

    self.urlString = @"http://mobads.baidu.com/cpro/ui/mads.php";
    
    NSDictionary *temp = @{@"code2":code};
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:temp];
    
    [self starLoadInformationWithParameters:dict URLString:self.urlString connectType:QLCWorkGET];

}

#pragma -mark 获取设置界面icon和图片标题
- (void)gettitleimage{
    
    [self setLoadObject:^id(id object){
        
        NSArray *tempArr = [MYList mj_objectArrayWithKeyValuesArray:[object objectForKey:@"square_list"]];
        return tempArr;
        
    }];
    
    self.urlString = @"http://api.budejie.com/api/api_open.php";
    
    NSDictionary *temp = @{@"a":@"square",
                           @"c":@"topic"
                           
                           };
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:temp];
    
    [self starLoadInformationWithParameters:dict URLString:self.urlString connectType:QLCWorkGET];
}

#pragma -mark 获取订阅界面icon和文字
- (void)getSubTag{
    
    [self setLoadObject:^id(id object){
        NSMutableArray *listArray = [SubTagList mj_objectArrayWithKeyValuesArray:object];
        //NSLog(@"接口类%@",listArray);
        return listArray;
    }];

    
    self.urlString = @"http://api.budejie.com/api/api_open.php";
    
    NSDictionary *temp = @{@"a":@"tag_recommend",
                           @"action":@"sub",
                           @"c":@"topic"
                           };
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:temp];
    
    [self starLoadInformationWithParameters:dict URLString:self.urlString connectType:QLCWorkGET];
    
}











#pragma mark - 初始化接口
- (instancetype)initWithBlocks:(QXPLoadFinishBlock)finshBlick faildBlock:(QXPLoadFailedBlock)faildBlock HUDBackgroundView:(UIView *)backgroundView {

    if ((self = [super init])) {
        self.loadFinshBlock = finshBlick;
        self.loadFaildBlock = faildBlock;
//       void (^blockQLC)(id responseObje) = finshBlick;
    }
    if (backgroundView) {
        self.HUDBackgroundView = backgroundView;
        self.MBHUDView = [[MBProgressHUD alloc] initWithView:backgroundView] ;
        [self.HUDBackgroundView addSubview:self.MBHUDView];
        self.MBHUDView.label.text = @"加载中...";
        [self.MBHUDView showAnimated:YES];
        self.MBHUDView.mode = MBProgressHUDModeIndeterminate;
        self.MBHUDView.removeFromSuperViewOnHide=YES;
        
    }
    
    return  self;
}

#pragma mark - 调用接口
+ (instancetype)interfaceWithFinshBlock:(QXPLoadFinishBlock)finshBlock
                             faildBlock:(QXPLoadFailedBlock)faildBlock
                      HUDBackgroundView:(UIView *)view{

    return  [[self alloc] initWithBlocks:finshBlock faildBlock:faildBlock HUDBackgroundView:view];
}

- (void)starLoadInformationWithParameters:(NSMutableDictionary *)parameters URLString:(NSString *)string connectType:(NSString *)type{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //设置获取的数据为json数据,获取到的时候已经解析好
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //请求超时和接受类型
    manager.requestSerializer.timeoutInterval = 30;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", @"text/plain", nil];
    
    //设置https支持
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    
    if ([type.lowercaseString isEqualToString:@"post"]) {
        
        [manager POST:self.urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self setingWithObject:responseObject error:nil];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self setingWithObject:nil error:error];
            
        }];
        
    } else if ([type.lowercaseString isEqualToString:@"get"]){
        
        [manager GET:self.urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self setingWithObject:responseObject error:nil];

    
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [self setingWithObject:nil error:error];
        }];
    }
    
   // [[QLCInterFaceMain share].interfaceArr addObject:self];
    
}
- (void)setingWithObject:(id)responseObject error:(NSError *)error{
    
    [self.MBHUDView hideAnimated:NO];
    
    if (!error && self.loadFinshBlock ) {
        
        if (self.loadObject) {

            id temp = self.loadObject(responseObject);
            
            self.loadFinshBlock(temp);
            
        }
        else{
            self.loadFinshBlock(responseObject);

        }
        
    }else if (error && self.loadFaildBlock){
        
        self.loadFaildBlock(error);
    }
    
   // [[QLCInterFaceMain share].interfaceArr removeObject:self];

}
@end
