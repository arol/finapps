//
//  LFObjectiusViewController.m
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFObjectiusViewController.h"
#import "Objectiu.h"

@interface LFObjectiusViewController ()
    @property (nonatomic,assign) int acumulat;
    @property (nonatomic,strong) Objectiu *objectiu;
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
    
    self.progressView.progress = 0.0;
    
    [Objectiu truncateAll];

}

- (void) viewDidAppear:(BOOL)animated
{
    
    NSArray *objectius = [Objectiu findAll];
    if (objectius.count > 0){
        self.objectiu = [objectius objectAtIndex:0];
    }
    
    if (self.objectiu){
        UIColor *tintColor = [UIColor colorWithRed:38.0/255 green:147.0/255.0 blue:1.0 alpha:1.0];
        [[UISlider appearance] setMinimumTrackTintColor:tintColor];
        [[CERoundProgressView appearance] setTintColor:tintColor];
        
        self.progressView.trackColor = [UIColor colorWithRed:0.0 green:89.9/255 blue:178.0/255.0 alpha:1.0];
        
        self.progressView.startAngle = (3.0*M_PI)/2.0;
        
        self.progressView.progress = 0.8;
        
        [self.botoNouObjectiu setHidden:YES];
        self.total.text = @"0";
        self.acumulat = 0;
        [self performSelector:@selector(omplirAconseguit) withObject:nil afterDelay:0.015];
        [self.total setHidden:NO];
        [self.restant setHidden:NO];
        [self.progressView setHidden:NO];
        [self.labelAcumulat setHidden:NO];
        [self.labelRestant setHidden:NO];
        [self.botoDetallObjectiu setHidden:NO];
    }
    else {
        [self.total setHidden:YES];
        [self.restant setHidden:YES];
        [self.progressView setHidden:YES];
        [self.labelAcumulat setHidden:YES];
        [self.labelRestant setHidden:YES];
        [self.botoDetallObjectiu setHidden:YES];
        [self.botoNouObjectiu setHidden:NO];
    }
    [self.segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    self.segmentedControl.tintColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    [self.segmentedControl setFrame:CGRectMake(18, 6, 290, 30)];
    [self.segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBezeled];    
}
- (void) omplirAconseguit
{
    if (self.acumulat >= 4138){
        self.total.text = [NSString stringWithFormat:@"4.138 €"];
        return;
    }
    
    self.acumulat+=122;
    self.total.text = [NSString stringWithFormat:@"%i €",self.acumulat];
    self.restant.text = [NSString stringWithFormat:@"%i €",5000 - self.acumulat];
    NSLog(@"%@",[NSString stringWithFormat:@"%i ",self.acumulat]);
    [self performSelector:@selector(omplirAconseguit) withObject:nil afterDelay:0.015];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
