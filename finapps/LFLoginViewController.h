//
//  LFLoginViewController.h
//  finapps
//
//  Created by Arol Viñolas on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

-(IBAction)login:(id)sender;

@end
