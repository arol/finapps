//
//  LFDashboardViewController.m
//  finapps
//
//  Created by Arol Viñolas on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFDashboardViewController.h"

#import "LFAccountController.h"

@interface LFDashboardViewController ()

@end

@implementation LFDashboardViewController

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
	// Do any additional setup after loading the view.
    

}

- (void)viewWillAppear:(BOOL)animated{
    LFAccountController *accountController = [LFAccountController sharedAccountController];
    
    NSNumber *estalviDiari = [NSNumber numberWithFloat:([[accountController pressupostDiari] floatValue] - [[accountController despesesDiaries] floatValue])];
    NSString *pressupostDiari = [NSString stringWithFormat:@"%2.f€", [estalviDiari floatValue]];
    [[self estalviLabel] setText:pressupostDiari];
    
    NSNumber *estalviMensual = [NSNumber numberWithFloat:([[accountController pressupostMensual] floatValue] - [[accountController despesesMensuals] floatValue])];
    NSString *pressupostMensual = [NSString stringWithFormat:@"Total mensual: %2.f€", [estalviMensual floatValue]];
    [[self estalviMensualLabel] setText:pressupostMensual];
    
    [self animateSavingBarTo:@50];
    
    [[LFAccountController sharedAccountController] despesesDiaries];
}

-(void) animateSavingBarTo:(NSNumber*)saving{
    [self.perduaBarImage setFrame:CGRectMake(self.estalviBarImage.frame.origin.x,
                                            self.perduaBarImage.frame.origin.y,
                                            0,
                                            self.perduaBarImage.frame.size.height)
    ];
    [self.estalviBarImage setFrame:CGRectMake(self.estalviBarImage.frame.origin.x,
                                             self.estalviBarImage.frame.origin.y,
                                             0,
                                             self.estalviBarImage.frame.size.height)
     ];
    
    LFAccountController *accountController = [LFAccountController sharedAccountController];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [dateFormatter setDateFormat:@"d"];
    NSNumber *actualDay = [numberFormatter numberFromString:[dateFormatter stringFromDate:[NSDate date]]];
    
    int widthWrapper = 140;
    float pressupostDiari = [[accountController pressupostDiari] floatValue];
    float despesaMensual = [[accountController despesesMensuals] floatValue];
    float pressupostMensual = [[accountController pressupostMensual] floatValue];
    
//    UIImageView *imageToResize;
    NSNumber *pressupostFinsAvui = [NSNumber numberWithFloat:(pressupostDiari*[actualDay floatValue])];
    
    float width = widthWrapper * (pressupostMensual - despesaMensual) / pressupostMensual;
    
    [UIView animateWithDuration:.75 delay:0. options:UIViewAnimationCurveEaseOut animations:^{
        if([pressupostFinsAvui floatValue] > despesaMensual ){
            [self.estalviBarImage setFrame:CGRectMake(self.estalviBarImage.frame.origin.x,
                                                      self.estalviBarImage.frame.origin.y,
                                                      width,
                                                      self.estalviBarImage.frame.size.height)];
        }else{
            [self.perduaBarImage setFrame:CGRectMake(self.estalviBarImage.frame.origin.x,
                                                     self.perduaBarImage.frame.origin.y,
                                                     width,
                                                     self.perduaBarImage.frame.size.height)];
        }
    } completion:^(BOOL finished) {
        
    }];
    
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
