//
//  CCViewController.m
//  ControlFlow
//
//  Created by Javlon Usmanov on 9/9/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

#import "CCViewController.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int truckSpeed = 120;
    int lamboSpeed = 60;
    int mySpeed = truckSpeed;
    if (mySpeed < 70) {
        NSLog(@"Keep Cruising...");
    } else {
        NSLog(@"Slow Down");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
