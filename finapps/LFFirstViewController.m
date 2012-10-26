//
//  LFFirstViewController.m
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFFirstViewController.h"
#import "CompteCorrent+Functions.h"

@interface LFFirstViewController ()

@end

@implementation LFFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [CompteCorrent findAllComptesCorrentsWith:^(NSArray *comptesCorrents) {
        NSLog(@"%@",comptesCorrents);
        for (CompteCorrent *cc in comptesCorrents) {
            NSLog(@"%@ : %@",cc.accountNumber,cc.availableBalance);
        }
    } errorResponse:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
