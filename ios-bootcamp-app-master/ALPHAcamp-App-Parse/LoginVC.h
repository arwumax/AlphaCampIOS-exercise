//
//  LoginVC.h
//  ALPHAcamp-App-Parse
//
//  Created by Tank Lin on 2015/6/28.
//  Copyright (c) 2015年 Tank Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputPasswordLabel;

@end
