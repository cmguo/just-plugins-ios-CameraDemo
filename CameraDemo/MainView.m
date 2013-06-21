//
//  MainView.m
//  CameraDemo
//
//  Created by pplive on 5/10/13.
//  Copyright (c) 2013 pplive. All rights reserved.
//

#import "MainView.h"
#import "CameraView.h"

@interface MainView ()

@end

@implementation MainView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSURL* url = [NSURL URLWithString: @"http://192.168.14.205/test-page/capture.htm"];
    NSURLRequest* request = [NSURLRequest requestWithURL: url];
    [self.webView loadRequest: request];
    
    self.webView.delegate = self;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL * url = request.URL;
    NSComparisonResult result = [url.path compare: @"/test-page/capture.htm"];
    if (result == NSOrderedSame)
        return YES;
    CameraView * cameraView = [[[CameraView alloc]initWithNibName:@"CameraView" bundle:nil]autorelease];
    [cameraView setUrl: url.absoluteString];
    [self presentViewController: cameraView animated: YES completion: nil];
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webView release];
    [super dealloc];
}
@end
