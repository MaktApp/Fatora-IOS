//
//  ViewController.h
//  FatoraStarterObjectiveC
//
//  Created by Mahmoud Shurrab on 3/10/20.
//  Copyright © 2020 Digits Arts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *generatePaymentButton;
- (IBAction)generatePaymentButtonTouchedUp:(UIButton *)sender;

@end

