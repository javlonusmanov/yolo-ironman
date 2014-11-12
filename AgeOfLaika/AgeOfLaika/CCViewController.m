//
//  CCViewController.m
//  AgeOfLaika
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertButton:(UIButton *)sender {
    float num = [self.userInputYears.text floatValue];
    float convertedNumber = num/7;
    self.dogYearsAnswer.text = [NSString stringWithFormat:@"%f", convertedNumber];
    self.showPicture.hidden = false;
}
- (IBAction)convertToRealDogYears:(UIButton *)sender {
    float num = [self.userInputYears.text floatValue];
    float convertedNumber;
    if (num > 2 ) {
        convertedNumber = (10.5 * 2)  +((num - 2) * 4);
    } else {
        convertedNumber = 10.5 * num;
    }
    self.realYearsLabel.text = [NSString stringWithFormat:@"%f", convertedNumber];
}
@end
