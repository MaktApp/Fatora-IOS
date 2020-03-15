//
//  AppWebViewController.h
//  FatoraStarterObjectiveC
//
//  Created by Mahmoud Shurrab on 3/10/20.
//  Copyright © 2020 Digits Arts. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppWebViewController : UIViewController <UIWebViewDelegate>

@property NSString *paymentURL;

@property (nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;
- (IBAction)closeButtonTouchedUp:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
