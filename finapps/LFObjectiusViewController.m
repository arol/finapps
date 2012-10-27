//
//  LFObjectiusViewController.m
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFObjectiusViewController.h"
#import "Objectiu.h"

#define TIME_OF_TRANSITION 0.015

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
        NSNumber *aconseguit = [NSNumber numberWithFloat:[self.objectiu.value floatValue] * 0.8];
        [self performSelector:@selector(omplirAconseguit:) withObject:aconseguit afterDelay:0.015];
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
    [self.segmentedControl setFrame:CGRectMake(34, 6, 290, 30)];
    [self.segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBezeled];
    
}
- (void) omplirAconseguit:(NSNumber *)valor
{
    if (self.acumulat >= [valor intValue]){
        self.total.text = [NSString stringWithFormat:@"%i €",[valor intValue]];
        return;
    }
    int numberOfCalls = [self numberOfCallsForDuration:0.5];
    self.acumulat += [valor intValue] / numberOfCalls;
    self.total.text = [NSString stringWithFormat:@"%i €",self.acumulat];
    self.restant.text = [NSString stringWithFormat:@"%i €",[self.objectiu.value intValue] - self.acumulat];
    NSLog(@"%@",[NSString stringWithFormat:@"%i ",self.acumulat]);
    [self performSelector:@selector(omplirAconseguit:) withObject:valor afterDelay:TIME_OF_TRANSITION];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (float) numberOfCallsForDuration:(float)duration
{
    return (float)(duration / TIME_OF_TRANSITION);
}

- (IBAction)valueChanged:(UISegmentedControl *)sender {
    NSLog(@"%i",[sender selectedSegmentIndex]);
    switch ([sender selectedSegmentIndex]) {
        case 0:
            NSLog(@"Objectius");
            [[self.reptesController view] removeFromSuperview];
            break;
        case 1:
            NSLog(@"Reptes");
            self.objectiusView = self.view;
            self.reptesController = [self.storyboard instantiateViewControllerWithIdentifier:@"reptes"];
            [self.reptesController.view setFrame:CGRectMake(self.reptesController.view.frame.origin.x, self.reptesController.view.frame.origin.y + 20, self.reptesController.view.frame.size.width, self.reptesController.view.frame.size.height)];
            [self.view addSubview:[self.reptesController view]];
            break;
            
        default:
            break;
    }
}
@end
