//
//  FootViewOfCollectionViewCell.h
//  BuDeJie
//
//  Created by Qlinchao on 17/4/1.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FootViewOfCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lable;

@property (nonatomic,strong) MYList *list;

@end
