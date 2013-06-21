//
//  CameraView.m
//  CameraDemo
//
//  Created by pplive on 5/10/13.
//  Copyright (c) 2013 pplive. All rights reserved.
//

#import "CameraView.h"

#import "PpboxSink/PpboxSink.h"

@interface CameraView ()

@end

@implementation CameraView
{
    NSString * url_;
    PpboxSink * sink;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setUrl: (NSString *)url
{
    url_ = url;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    sink = [[PpboxSink alloc] init];
    [sink open: url_];
    [self.view.layer insertSublayer: sink.previewLayer
                              above: [[self.view.layer sublayers] objectAtIndex: 11]];    
}

- (void)viewWillUnload
{
    [sink close];
    [sink release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPreviewButtonDown:(id)sender
{
}

- (IBAction)onPlayButtonDown:(id)sender
{
    [sink start];
}

- (IBAction)onStopButtonDown:(id)sender
{
    [sink stop];
}

- (IBAction)onBackButtonDown:(id)sender
{
    [self dismissViewControllerAnimated: YES completion: nil];
}

@end
