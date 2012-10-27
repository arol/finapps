//
//  LFCreateObjectiuViewController.h
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFCreateObjectiuViewController : UIViewController

- (IBAction)crearObjectiu:(id)sender;
- (IBAction)cancelar:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *quantitat;

@end
