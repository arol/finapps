//
//  LFSelectorCategoriaViewController.h
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Operacio+Functions.h"

@interface LFSelectorCategoriaViewController : UIViewController <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) Operacio *operacio;

- (IBAction)closeModal:(id)sender;
- (IBAction)afegirCategoria:(id)sender;

@end
