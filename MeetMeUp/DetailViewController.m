//
//  DetailViewController.m
//  MeetMeUp
//
//  Created by S on 10/13/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *labelEventName;
@property (strong, nonatomic) IBOutlet UILabel *labelRSVPCount;
@property (strong, nonatomic) IBOutlet UILabel *labelHostingGroup;
@property (strong, nonatomic) IBOutlet UILabel *labelDescription;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.labelEventName.text = [self.eventSegue objectForKey:@"name"];
    self.labelDescription.text = [self.eventSegue objectForKey:@"description"];

    NSDictionary *forHost = [self.eventSegue objectForKey:@"group"];
    self.labelHostingGroup.text = [forHost objectForKey:@"name"];

    //convert int to string
    /*long rsvpInt = [self.eventSegue objectForKey:@"rsvp_limit"];
    NSString *rsvpString = [NSString stringWithFormat:@"%ld",rsvpInt];
    self.labelRSVPCount.text = rsvpString;*/

}



@end
