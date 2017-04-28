//
//  tempView.h
//  BuDeJie
//
//  Created by Qlinchao on 17/3/31.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tempViewBlock)(UIColor *tempColor);

@protocol tempViewDelegate <NSObject>


- (void)getSomethingFromtempView;


@end

@interface tempView : UIView


@property (nonatomic, assign) id <tempViewDelegate> delegate;

@property (nonatomic,copy)tempViewBlock tempBlock;

@end
