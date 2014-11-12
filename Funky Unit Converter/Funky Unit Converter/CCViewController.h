//
//  CCViewController.h
//  Funky Unit Converter
//
//  Created by Javlon Usmanov on 9/8/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *numberOfBillsLabel;
@property (strong, nonatomic) IBOutlet UITextField *numberOfBillsTextField;
- (IBAction)convertUnits:(UIButton *)sender;

@end
