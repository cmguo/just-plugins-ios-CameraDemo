//
//  MainView.h
//  CameraDemo
//
//  Created by pplive on 5/10/13.
//  Copyright (c) 2013 pplive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIViewController <UIWebViewDelegate>

@property (retain, nonatomic) IBOutlet UIWebView *webView;

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;

@end
