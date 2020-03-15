//
//  ViewController.m
//  FatoraStarterObjectiveC
//
//  Created by Mahmoud Shurrab on 3/10/20.
//  Copyright © 2020 Digits Arts. All rights reserved.
//

#import "ViewController.h"
#import "AppWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)generatePaymentButtonTouchedUp:(UIButton *)sender {
    // URL of the endpoint we're going to contact (maktapp credit endpoint.
    NSURL *url = [NSURL URLWithString:@""];

    // Create a simple dictionary with numbers.
    NSDictionary *dictionary = @{
      @"token": @"", //put here your account token
      @"currencyCode": @"",//put here your currency code
      @"orderId": @"", //put here your order id
      @"Note": @"", //put here your notes
      @"customeremail": @"",//put here your customer email
      @"customerName": @"",//put here your customer name
      @"customerPhone": @"",//put here your customer phone
      @"isrecurring": @"",//if your payment is recurring so you need to put (1) else (0)
      @"customerCountry": @"",//put here your customer country
      @"Lang": @"",//put here your language (en or ar)
      @"Amount": @"",// put here your amount
      @"from": @(0)// put here from attributes value
    };
    
    // Convert the dictionary into JSON data.
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:0
                                                         error:nil];
    
    // Create a POST request with our JSON as a request body.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = JSONData;
    
    // Create a task.
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if(!error){
            NSLog(@"Status code: %li", (long)((NSHTTPURLResponse *)response).statusCode);
            //if code is 200 so the request return success so the response came back with data object that contain result value this have payment url link
            AppWebViewController *appWebViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AppWebViewController"];
            appWebViewController.paymentURL = @"";
            [self presentViewController:appWebViewController animated:YES completion:nil];
        } else {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
    
    // Start the task.
    [task resume];
    
    AppWebViewController *appWebViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AppWebViewController"];
    [self presentViewController:appWebViewController animated:YES completion:nil];
}

@end
