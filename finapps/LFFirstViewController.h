//
//  LFFirstViewController.h
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFFirstViewController : UIViewController  <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *proporcioMensual;
@property (weak, nonatomic) IBOutlet UILabel *dinersCompte;

@end
