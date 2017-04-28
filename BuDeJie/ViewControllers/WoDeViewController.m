//
//  WoDeViewController.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/29.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "WoDeViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "LoaginViewController.h"
#import "FootViewOfCollectionViewCell.h"
#import "SettingViewController.h"
@interface WoDeViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) MYList *myList;
@property (nonatomic,strong) NSMutableArray *listArray;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation WoDeViewController


static NSString *collecID = @"ID";

//懒加载我的界面数据
-(NSMutableArray *)listArray{
    if (_listArray == nil) {
        
        _listArray = [[NSMutableArray alloc] init];
    
        _myList = [[MYList alloc] init];
        //给listArray赋值
        [[QLCInterFace interfaceWithFinshBlock:^(id responseObje) {
            
            [responseObje enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                _myList = obj;
                [_listArray addObject:_myList];

                _tableView.tableFooterView = [self setTableViewFootView];
            }];
            
            
        } faildBlock:^(NSError *error) {
            NSLog(@"error:%@",error);
        } HUDBackgroundView:self.view] gettitleimage];
        
    }
    return _listArray;

}


- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setWoDeNAVRelated];
    NSLog(@"%@",self.listArray);

//    self.automaticallyAdjustsScrollViewInsets = NO;

    [self.view addSubview:[self loadTableview]];
    NSLog(@"%@",self.listArray);
//    [[QLCUser shareUser] exit];

}

-(void)setWoDeNAVRelated{
    self.navigationItem.title =@"我的";
    
    //夜间模式按钮
    UIButton *moonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [moonBtn setImage:[UIImage imageNamed:@"mine-moon-icon"] forState:UIControlStateNormal];
    [moonBtn setImage:[UIImage imageNamed:@"mine-moon-icon-click"] forState:UIControlStateSelected];
    [moonBtn addTarget:self action:@selector(didMoonBtn:) forControlEvents:UIControlEventTouchUpInside];
    [moonBtn sizeToFit];
    UIBarButtonItem *moonItem =  [[UIBarButtonItem alloc] initWithCustomView:moonBtn];
    
    //我的设置按钮
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [setBtn setImage:[UIImage imageNamed:@"mine-setting-icon"] forState:UIControlStateNormal];
    [setBtn setImage:[UIImage imageNamed:@"mine-setting-icon-click"] forState:UIControlStateHighlighted];
    [setBtn addTarget:self action:@selector(didSettingBtn) forControlEvents:UIControlEventTouchUpInside];
    [setBtn sizeToFit];
    UIBarButtonItem *setItem =  [[UIBarButtonItem alloc] initWithCustomView:setBtn];
    
    self.navigationItem.rightBarButtonItems = @[setItem,moonItem];

}

-(void)didMoonBtn:(UIButton *)button{
    
    button.selected = !button.selected;

}

-(void)didSettingBtn{
    SettingViewController *setVC = [[SettingViewController alloc] init];
    
    [self.navigationController pushViewController:setVC animated:YES];
    
}

-(UITableView *)loadTableview{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    //设置tableviewsection之间宽度和tableview头尾
    _tableView.sectionHeaderHeight = 0;
    _tableView.sectionFooterHeight = 10;
    _tableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
    
    //处理UICollectionView超出屏幕问题
    _tableView.autoresizingMask = UITableViewAutomaticDimension;
    _tableView.autoresizesSubviews = NO;
    
//    _tableView.tableFooterView = [self setTableViewFootView];
    return _tableView;
}


#pragma mark - tableView数据源和代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登录/注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    } else {
        cell.textLabel.text = @"离线下载";
    }
    
    return cell;
    
}




#pragma mark - tableView底部视图
-(UICollectionView *)setTableViewFootView{
    
    static NSInteger column = 4;
    static CGFloat margin = 1;
    
    
    CGFloat itemHW = ([UIScreen mainScreen].bounds.size.width - (column - margin)) / column;
    
    NSInteger row = (self.listArray.count - 1) / column + 1;
    
    CGFloat collectionVHeight = itemHW * row + (row - 1);
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemHW, itemHW);

    layout.minimumLineSpacing = 1;
    layout.minimumInteritemSpacing = 1;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, collectionVHeight) collectionViewLayout:layout];
    
    collectionView.backgroundColor = self.view.backgroundColor;
    
    collectionView.scrollEnabled = NO;
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([FootViewOfCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:collecID];
    return collectionView;
}

#pragma mark - collectionView数据源和代理方法


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.listArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FootViewOfCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collecID forIndexPath:indexPath];
   
    cell.list = self.listArray[indexPath.item];
    //icon name url

    return cell;
    
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

