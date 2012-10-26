//
//  LFFirstViewController.m
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFFirstViewController.h"
#import "CompteCorrent+Functions.h"
#import "Operacio+Functions.h"

@interface LFFirstViewController ()
    @property (nonatomic, strong) NSArray *operacions;
@end

@implementation LFFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *accountId = @"508ac427e4b0d77699b685d4";
    
    [CompteCorrent findAllComptesCorrentsWith:^(NSArray *comptesCorrents) {

        for (CompteCorrent *cc in comptesCorrents) {
            if ([cc.ident isEqualToString:accountId]){
                self.dinersCompte.text =  [NSString stringWithFormat:@"%.2f €",[cc.availableBalance floatValue]];
                self.proporcioMensual.text = [NSString stringWithFormat:@"%.2f €",[cc.availableBalance floatValue] / 30];
            }
            NSLog(@"%@ : %@",cc.accountNumber,cc.availableBalance);
        }
        NSLog(@"==========================");
    } errorResponse:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    [Operacio findAllOperacionsInAccount:accountId With:^(NSArray *operacions) {
        self.operacions = operacions;
        [self.tableView reloadData];
        
        for (Operacio *op in operacions) {
            NSLog(@"%@ : %@",op.concept,op.value);
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

#pragma mark = Table View

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    Operacio *operacio = [self.operacions objectAtIndex:indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:@"operacioCell"];
    
    UILabel *concept = (UILabel *)[cell viewWithTag:1];
    UILabel *ammount = (UILabel *)[cell viewWithTag:2];
    
    concept.text = [NSString stringWithFormat:@"%@",operacio.concept];
    if ([operacio.value floatValue] < 0.0){
        [ammount setTextColor:[UIColor colorWithRed:178/255 green:0 blue:0 alpha:1.0]];
    }
    ammount.text = [NSString stringWithFormat:@"%.2f €",[operacio.value floatValue]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.operacions.count;
}


@end
