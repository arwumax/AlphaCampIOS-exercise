//
//  LoginVC.m
//  ALPHAcamp-App-Parse
//
//  Created by Tank Lin on 2015/6/28.
//  Copyright (c) 2015年 Tank Lin. All rights reserved.
//

#import "LoginVC.h"
#import <AFNetworking.h>
//#import <Parse/Parse.h>

@interface LoginVC ()
@property AFHTTPRequestOperationManager *manager;
@end

@implementation LoginVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [gestureRecognizer setDelegate:self];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    NSString *titleString = [NSString stringWithFormat:@"%@", (@"Login")];
    self.title = titleString;
    

    _manager = [AFHTTPRequestOperationManager manager];

}

- (void)hideKeyboard
{
    [self.view endEditing:YES];
    
}

//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//    if ([self.imputUsername.text isEqualToString:self.passUsername] && [self.inputPassword.text isEqualToString:self.passPassword]) {
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        [manager POST:@"https://dojo.alphacamp.co/api/v1/login"  parameters:@{@"api_key":@"024da7a005659cbc910035ddf69b5817efe6e679", @"email": @"tanknmm@gmail.com", @"password":@"tank1005"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            [[NSUserDefaults standardUserDefaults] setValue:responseObject[@"auth_token"] forKey:@"auth_token"];
//            [[NSUserDefaults standardUserDefaults] synchronize];  /// 立刻同步儲存
//            /// 停止 indicator動畫
//            //  [indicatorView stopAnimating];
//            [self performSegueWithIdentifier:@"coursesSegue" sender:self];    /// Segue下個veiw
//            NSLog(@"JSON: %@", responseObject);
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//        }];
//        return YES;
//    } else {
//        //        NSLog(@"Wrong User Name");
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops! You're incorrect \ue107" message:nil delegate:nil cancelButtonTitle:@"Try again" otherButtonTitles:nil];
//        [alert show];
//        return NO;
//    }
//}

- (IBAction)loginCheckButton:(id)sender
{
    [_manager POST:@"https://dojo.alphacamp.co/api/v1/login" parameters:@{
                                                                      @"api_key":@"024da7a005659cbc910035ddf69b5817efe6e679",
                                                                          @"email":@"tanknmm@gmail.com", //_inputNameLabel.text,
                                                                          @"password":@"tank1005"//_inputPasswordLabel.text
                                                                          }
           success:^(AFHTTPRequestOperation *operation, id responseObject) {
               // [[NSUserDefaults standardUserDefaults] setValue:responseObject[@"auth_token"] forKey:@"auth_token"];
               // [[NSUserDefaults standardUserDefaults] synchronize];  /// 立刻同步儲存
               
               // [self performSegueWithIdentifier:@"coursesSegue" sender:self];    /// Segue下個veiw
               // NSLog(@"JSON: %@", responseObject);
               
               [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"tabViewController"] animated:YES completion:nil];
               NSLog(@"Login Success");
           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops! You're incorrect \ue107" message:nil delegate:nil cancelButtonTitle:@"Try again" otherButtonTitles:nil];
               [alert show];
              NSLog(@"Login Success");
               // NSLog(@"Error: %@", error);
           }];
}

//- (void)checkLoginStatus {
///// 用Parse
////    PFUser *user = [PFUser user];
//    [PFUser logInWithUsernameInBackground:(_inputNameLabel.text) password:(_inputPasswordLabel.text) block:^(PFUser *user, NSError *error) {
//        if (user) {
//            [self performSegueWithIdentifier:@"coursesSegue" sender:self];
//            NSLog(@"Login OK,%@\n %@\n", _inputNameLabel, _inputPasswordLabel);
//        } else {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops! You're incorrect \ue107" message:nil delegate:nil cancelButtonTitle:@"Try again" otherButtonTitles:nil];
//            [alert show];
//            NSLog(@"Login Failed");
//        }
//    }];
//}
//}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
