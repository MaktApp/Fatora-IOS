//
//  AppWebViewController.m
//  FatoraStarterObjectiveC
//
//  Created by Mahmoud Shurrab on 3/10/20.
//  Copyright © 2020 Digits Arts. All rights reserved.
//

#import "AppWebViewController.h"

@interface AppWebViewController ()

@end

@implementation AppWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableURLRequest * request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:_paymentURL]];
    [_webView loadRequest:request];
}

- (IBAction)closeButtonTouchedUp:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
   NSLog(@"shouldStartLoadWithRequest URL :%@",request.URL.absoluteString);
 
    //return FALSE; //to stop loading
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webViewDidStartLoad URL :%@",webView.request.URL.absoluteString);
    if([webView.request.URL.absoluteString containsString:@"Pay/SuccessPay"]){
        //here you can put anything you want after payment success
    }else if([webView.request.URL.absoluteString containsString:@"Pay/CancelCreditCard"]){
        //here you can put anything you want after payment cancelled
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad URL :%@",webView.request.URL.absoluteString);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"didFailLoadWithError :%@",[error debugDescription]);
 
}

@end
