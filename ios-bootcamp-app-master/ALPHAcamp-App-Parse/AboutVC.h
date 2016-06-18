//
//  AboutVC.h
//  ALPHAcamp-App-Parse
//
//  Created by Tank Lin on 2015/7/1.
//  Copyright (c) 2015年 Tank Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutVC : UIViewController {
    NSDictionary *dictMemberA;
    NSDictionary *dictMemberB;
    NSDictionary *dictMemberC;
    NSDictionary *dictTeacherA;
    NSDictionary *dictTeacherB;
    NSDictionary *dictTeacherC;
    NSDictionary *dictOldschoolA;
    NSDictionary *dictOldschoolB;
    NSDictionary *dictOldschoolC;
    NSArray *arrayPeople0;
    NSArray *arrayPeople1;
    NSArray *arrayPeople2;
    NSArray *arraySegment;
}

- (IBAction)changeSegment:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *peopleView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIButton *buttonPrevious;
@property (weak, nonatomic) IBOutlet UIButton *buttonNext;

@end
