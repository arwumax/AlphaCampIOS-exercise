//
//  SubClassTableVC.m
//  ALPHAcamp-App-Parse
//
//  Created by Tank Lin on 2015/6/29.
//  Copyright (c) 2015年 Tank Lin. All rights reserved.
//

#import "ClassTableVC.h"
#import "SubClassTableVC.h"

@interface SubClassTableVC ()

@end

@implementation SubClassTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _classDetail = @[
                    @[@"Software Development Life Cycle (Shyne)", @"Software System Architecture (Shyne)", @"User Story and Wireframe (Paul)", @"Wireframe & Pre-totype (Paul)", @"Mac OS X 使用教學"],
                    @[@"Objective-C Basic", @"Objective-C Basic II", @"Objective-C Basic III", @"iOS UI Element Part I", @"iOS UI Element Part II & AutoLayout Part I"],
                    @[@"Objective-C - Class/Object & UI Element Part II", @"AutoLayout Part II & iOS UI Element Part III", @"Property & Delegate", @"Autolaout & Property & Delegate", @"Week 2-3 Review"],
                    @[@"aaaaaa", @"bbbbbbb", @"ccccccccc", @"dddddddd", @"eeeee"],
                    @[@"AAAAAAAA", @"BBBBBBB", @"CCCCCCC", @"DDDD", @"EEEE"],
                    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_classDetail count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [[_classDetail objectAtIndex:_receive] objectAtIndex:indexPath.row];
    
    return cell;
}


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
