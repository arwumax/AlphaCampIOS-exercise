//
//  EventTableVC.m
//  ALPHAcamp-App-Parse
//
//  Created by Tank Lin on 2015/6/30.
//  Copyright (c) 2015年 Tank Lin. All rights reserved.
//

#import "EventTableVC.h"
#import <Parse/Parse.h>
#import "WebVC.h"

@interface EventTableVC () {
    int Number;
}
@property (weak, nonatomic) UIImage *image;
@property (strong, nonatomic) NSArray *eventArray;
@property (strong, nonatomic) NSString *eventUrl;
@end

@implementation EventTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alpha-logo-titleview.png"]];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Event"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        _eventArray = array;
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_eventArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Cell = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell forIndexPath:indexPath];

    ;
    PFObject *event = _eventArray[indexPath.row];
    
    UIImageView *eventImage = (UIImageView *)[cell viewWithTag:100];
    eventImage.image = nil;
    PFFile *imageData = event[@"image"];
    [imageData getDataInBackgroundWithBlock:^(NSData *imgData, NSError *error) {
        if (error == nil) {
            eventImage.image = [UIImage imageWithData:imgData];
            eventImage.backgroundColor = [UIColor clearColor];
        } else {
//            eventImage.image = [UIImage imageNamed:@"image-bg.png"];  // #if not laod image, show this.
            eventImage.backgroundColor = [UIColor grayColor];
        }
    }];

    
    UILabel *eventTitle = (UILabel *)[cell viewWithTag:200];
    eventTitle.text = event[@"eventName"];

    UILabel *eventDate = (UILabel *)[cell viewWithTag:300];
    eventDate.text = event[@"dateString"];

    UITextField *eventContent = (UITextField *)[cell viewWithTag:400];
    eventContent.text = event[@"content"];
    
    Number = (int)indexPath.row;
    
    _eventUrl = event[@"eventURL"];
    
    UIButton *eventButton = (UIButton *)[cell viewWithTag:500];
    [eventButton addTarget:self action:@selector(moveToWebView:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;    
}

- (void)moveToWebView:(UIButton *)button {
    [self performSegueWithIdentifier:@"webView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebVC *webVC = segue.destinationViewController;
    webVC.indexArrURL = _eventUrl;
    NSLog(@"segue url: %@", _eventUrl);
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
