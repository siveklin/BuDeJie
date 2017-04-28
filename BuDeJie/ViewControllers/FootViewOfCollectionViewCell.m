//
//  FootViewOfCollectionViewCell.m
//  BuDeJie
//
//  Created by Qlinchao on 17/4/1.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "FootViewOfCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation FootViewOfCollectionViewCell

-(void)setList:(MYList *)list{
    _list = list;
    _lable.text = list.name;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:list.icon]];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
