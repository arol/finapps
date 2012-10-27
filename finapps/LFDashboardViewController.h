//
//  LFDashboardViewController.h
//  finapps
//
//  Created by Arol Viñolas on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFDashboardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *carrecsRestantsButton;
@property (weak, nonatomic) IBOutlet UILabel *estalviLabel;
@property (weak, nonatomic) IBOutlet UILabel *estalviMensualLabel;

@property (weak, nonatomic) IBOutlet UIImageView *perduaBarImage;
@property (weak, nonatomic) IBOutlet UIImageView *estalviBarImage;

@property (weak, nonatomic) IBOutlet UIButton *objectiuButton;
@property (weak, nonatomic) IBOutlet UIButton *estalviButton;

- (IBAction)obrirExtracte:(id)sender;
 
@end
