//
//  LFObjectiusViewController.m
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFObjectiusViewController.h"

@interface LFObjectiusViewController ()

@end

@implementation LFObjectiusViewController

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

    UIColor *tintColor = [UIColor colorWithRed:38.0/255 green:147.0/255.0 blue:1.0 alpha:1.0];
    [[UISlider appearance] setMinimumTrackTintColor:tintColor];
    [[CERoundProgressView appearance] setTintColor:tintColor];
    
    self.progressView.trackColor = [UIColor colorWithRed:0.0 green:89.9/255 blue:178.0/255.0 alpha:1.0];
    
    self.progressView.startAngle = (3.0*M_PI)/2.0;
    
    self.progressView.progress = 0.8;
    
    [self.segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    self.segmentedControl.tintColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    [self.segmentedControl setFrame:CGRectMake(18, 6, 290, 30)];
    [self.segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBezeled];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
