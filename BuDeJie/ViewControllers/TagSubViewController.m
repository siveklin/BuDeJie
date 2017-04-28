//
//  TagSubViewController.m
//  BuDeJie
//
//  Created by Qlinchao on 17/4/3.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "TagSubViewController.h"
#import "TagSubTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TagSubViewController ()

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation TagSubViewController



static NSString *cellID = @"cellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[QLCInterFace interfaceWithFinshBlock:^(id responseObje) {
        self.dataArray = responseObje;
        
        [self.tableView reloadData];
        
        NSLog(@"解析后数据包装成模型后打印:%@",responseObje);
        
    } faildBlock:^(NSError *error) {
        NSLog(@"订阅界面错误%@",error);
    } HUDBackgroundView:self.view] getSubTag];
    
  
    
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.rowHeight = 80;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TagSubTableViewCell class]) bundle:nil]  forCellReuseIdentifier:cellID];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    TagSubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    SubTagList *list = self.dataArray[indexPath.row];
    [cell.image_list sd_setImageWithURL:[NSURL URLWithString:list.image_list]];
     cell.theme_name.text = list.theme_name;
    if ([list.sub_number intValue]  > 10000) {
        cell.sub_number.text = [NSString stringWithFormat:@"%.1f万订阅",[list.sub_number intValue] / 10000.0];
    } else {
        cell.sub_number.text = [NSString stringWithFormat:@"%@订阅",list.sub_number];
    }
    
    
    return cell;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
