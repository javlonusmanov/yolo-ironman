//
//  CCViewController.m
//  Funky Unit Converter
//
//  Created by Javlon Usmanov on 9/8/14.
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
    NSLog(@"hello world");
    int x;
    x = 5;
    float heightOfEverstBaseCamp = 16900.3;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemeoryWarning method is evaluating");
}

- (IBAction)convertUnits:(UIButton *)sender {
    float numberOfBills = [self.numberOfBillsTextField.text floatValue];
    float numberOfFootballFields = numberOfBills/91440;
    self.numberOfBillsLabel.text = [NSString stringWithFormat:@"%f", numberOfFootballFields];
}
@end
