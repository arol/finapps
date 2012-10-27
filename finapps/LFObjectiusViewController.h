//
//  LFObjectiusViewController.h
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CERoundProgressView.h"
#import "LFReptesViewController.h"

@interface LFObjectiusViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UILabel *restant;
@property (weak, nonatomic) IBOutlet UIButton *botoNouObjectiu;
@property (weak, nonatomic) IBOutlet UIButton *botoDetallObjectiu;
@property (nonatomic,weak) IBOutlet CERoundProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *labelAcumulat;
@property (weak, nonatomic) IBOutlet UILabel *labelRestant;

@property (strong,nonatomic) UIView *objectiusView;
@property (strong,nonatomic) LFReptesViewController *reptesController;

- (IBAction)valueChanged:(UISegmentedControl *)sender;

@end
