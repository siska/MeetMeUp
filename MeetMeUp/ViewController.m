//
//  ViewController.m
//  MeetMeUp
//
//  Created by S on 10/13/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray *eventsInfoArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=5c141e6f197b202950a3f4d15345f26"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", jsonString); //used to see if correctly retrieving data

        NSError *jsonError = nil;

        if (data)
        {
            self.eventsInfoArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            [self.tableView reloadData];
        }

        NSLog(@"Connection Error: %@", connectionError);
        NSLog(@"JSON Error: %@", jsonError);
    }];
}




@end
