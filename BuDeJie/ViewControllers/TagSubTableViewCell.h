//
//  TagSubTableViewCell.h
//  BuDeJie
//
//  Created by Qlinchao on 17/4/3.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagSubTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image_list;
@property (weak, nonatomic) IBOutlet UILabel *theme_name;

@property (weak, nonatomic) IBOutlet UIButton *is_sub;
@property (weak, nonatomic) IBOutlet UILabel *sub_number;


@end
