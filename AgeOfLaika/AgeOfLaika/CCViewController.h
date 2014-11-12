//
//  CCViewController.h
//  AgeOfLaika
//
//  Created by Javlon Usmanov on 9/8/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *userInputYears;
@property (strong, nonatomic) IBOutlet UILabel *dogYearsAnswer;
- (IBAction)convertButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIImageView *showPicture;
@property (strong, nonatomic) IBOutlet UILabel *realYearsLabel;
- (IBAction)convertToRealDogYears:(UIButton *)sender;

@end
