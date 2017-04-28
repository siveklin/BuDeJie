//
//  LoginView.m
//  BuDeJie
//
//  Created by Qlinchao on 17/3/30.
//  Copyright © 2017年 JAYA. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()
@property (weak, nonatomic) IBOutlet UIButton *loginRegistBtn;



@end

@implementation LoginView

+(instancetype)loadLoginView{
   return  [[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil] firstObject];
}

- (IBAction)login:(UIButton *)sender {
    
    [self.textF_pwd resignFirstResponder];
    [self.textF_phone resignFirstResponder];

    if (self.loginVBlock) {
        self.loginVBlock(self.textF_phone.text,self.textF_pwd.text);
        
        
//    self.loginVBlock(self.textF_phone.text,@"5VRrP3aEtL0e464eMWLfgQ==");
        
    }
    
}


-(void)awakeFromNib{
//    UIImage *image = _loginRegistBtn currentImage;
//    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
//    [_loginRegistBtn setBackgroundImage:image forState:UIControlStateNormal];
//    UIImage *imageHigh = [UIImage imageNamed:@"loginBtnBgClick"];
//    imageHigh = [imageHigh stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
//    [_loginRegistBtn setBackgroundImage:imageHigh forState:UIControlStateHighlighted];
    [super awakeFromNib];
}



@end

@implementation RegistView

-(void)awakeFromNib{
    //    UIImage *image = _loginRegistBtn currentImage;
    //    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    //    [_loginRegistBtn setBackgroundImage:image forState:UIControlStateNormal];
    //    UIImage *imageHigh = [UIImage imageNamed:@"loginBtnBgClick"];
    //    imageHigh = [imageHigh stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    //    [_loginRegistBtn setBackgroundImage:imageHigh forState:UIControlStateHighlighted];
    [super awakeFromNib];
}


+(instancetype)loadRegistView{
    return  [[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil] lastObject];
}


@end
