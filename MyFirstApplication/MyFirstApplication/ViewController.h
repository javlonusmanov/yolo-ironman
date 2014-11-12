//
//  ViewController.h
//  MyFirstApplication
//
//  Created by Javlon Usmanov on 9/8/14.
//  Copyright (c) 2014 Javlon Usmanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)buttonPressed:(UIButton *)sender;

@end

