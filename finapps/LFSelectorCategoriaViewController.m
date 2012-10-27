//
//  LFSelectorCategoriaViewController.m
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFSelectorCategoriaViewController.h"
#import "Categoria.h"
#import "UIAlertView+MKBlockAdditions.h"

#import "LFAccountController.h"

@interface LFSelectorCategoriaViewController ()
    @property (nonatomic, assign) BOOL isAdding;
    @property (nonatomic, strong) NSMutableArray *categories;
@end

@implementation LFSelectorCategoriaViewController

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

    self.categories = [NSMutableArray arrayWithArray:[Categoria findAllSortedBy:@"nom" ascending:YES]];
    [self.tableview reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; 
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeModal:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)afegirCategoria:(UIBarButtonItem *)sender {
    [sender setEnabled:YES];
    
    if (!self.isAdding){
        [self.tableview beginUpdates];
        NSIndexPath *ip = [NSIndexPath indexPathForItem:0 inSection:0]; 
        [self.tableview insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
        self.isAdding = YES;
        [self.tableview endUpdates];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isAdding) return self.categories.count + 1;
    else return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (self.isAdding && indexPath.row == 0){
        cell = [tableView dequeueReusableCellWithIdentifier:@"novaCategoriaCell"];
        UITextField *categoriaTextfield = (UITextField *)[cell viewWithTag:1];
        [categoriaTextfield setDelegate:self];
        [categoriaTextfield setReturnKeyType:UIReturnKeyDone];
        [categoriaTextfield becomeFirstResponder];
        [categoriaTextfield setText:@""];
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"categoriaCell"];
        Categoria *categoria = [self.categories objectAtIndex:indexPath.row];
        
        UILabel *nom = (UILabel *)[cell viewWithTag:1];
        nom.text = [categoria.nom uppercaseString];
        
        UIButton *recursiveButton = (UIButton*)[cell viewWithTag:2];
        [recursiveButton addTarget:self
                            action:@selector(toggleRecursive:)
                  forControlEvents:UIControlEventTouchUpInside];
        
        if ([[categoria isRecursive] boolValue]) {
            [recursiveButton setSelected:YES];
        }else{
            [recursiveButton setSelected:NO];
        }
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.operacio setCategoria:[self.categories objectAtIndex:indexPath.row]];
    NSArray *operacions = [Operacio findByAttribute:@"concept" withValue:self.operacio.concept];
    if (operacions.count>1){
        [UIAlertView alertViewWithTitle:@"Assignar categoria"
                                message:[NSString stringWithFormat:@"Vols assignar aquesta categoria a tot el que tingui el concepte %@ (%i operacions) i en futures operacions?",self.operacio.concept, operacions.count - 1] cancelButtonTitle:@"No" otherButtonTitles:[NSArray arrayWithObject:@"Si"] onDismiss:^(int buttonIndex) {

            for (Operacio *operacio in operacions) {
                [operacio setCategoria:[self.categories objectAtIndex:indexPath.row]];
            }
            [self closeModal:nil];
            
            [[LFAccountController sharedAccountController] evaluateOperations:self.operacions];
                                    
        } onCancel:^{
            NSLog(@"no");
            [self closeModal:nil];
        }];
    }
    else {
        [self closeModal:nil];        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""]){
        [textField resignFirstResponder];
        [self guardarCategoria:textField.text];
    }
    else {
        [UIAlertView alertViewWithTitle:@"Error" message:@"No pots crear una categoria buida"];
    }
    

    return YES;
}

- (void) guardarCategoria:(NSString *)nomCategoria
{
    if (![nomCategoria isEqualToString:@""]){
        Categoria *categoria = [Categoria createEntity];
        categoria.nom = nomCategoria;
        [[NSManagedObjectContext defaultContext] save];
        self.isAdding = NO;
        self.categories = (NSArray*)[Categoria findAllSortedBy:@"nom" ascending:YES];
        [self.tableview reloadData];
    }
}

-(void)toggleRecursive:(id)sender{
    UIButton *button = (UIButton*)sender;
    
    UITableViewCell *cell = (UITableViewCell*)[[sender superview] superview];


    Categoria *categoria = [self.categories objectAtIndex:[self.tableview indexPathForCell:cell].row];
    
    if ([button isSelected]) {
        [button setSelected:NO];
        
        [categoria setIsRecursive:[NSNumber numberWithBool:NO]];
    }else{
        [button setSelected:YES];
        
        [categoria setIsRecursive:[NSNumber numberWithBool:YES]];
    }
    
        [[NSManagedObjectContext defaultContext] save];
    
    [self.tableview reloadData];
}

@end
