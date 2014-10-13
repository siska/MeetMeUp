//
//  ViewController.m
//  MeetMeUp
//
//  Created by S on 10/13/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
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
            NSDictionary *tempDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError]; //this pulls in entire dictionary with two keys - results and meta - we just want results
            self.eventsInfoArray = [tempDict objectForKey:@"results"]; //this just gives us the results object and puts it in my eventsInfoArray

            //self.eventsInfoArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            [self.tableView reloadData];
        }

        NSLog(@"Connection Error: %@", connectionError);
        NSLog(@"JSON Error: %@", jsonError);
    }];
}

#pragma mark - TableViewDataSource Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eventsInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *eventDict = [self.eventsInfoArray objectAtIndex:indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLID"]; // forIndexPath:indexPath];

    cell.textLabel.text = [eventDict objectForKey:@"name"];
    return cell;
}











@end
