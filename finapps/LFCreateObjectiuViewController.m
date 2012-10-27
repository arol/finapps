//
//  LFCreateObjectiuViewController.m
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFCreateObjectiuViewController.h"
#import "Objectiu.h"

@interface LFCreateObjectiuViewController ()

@end

@implementation LFCreateObjectiuViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)crearObjectiu:(id)sender {
    Objectiu *objectiu = [Objectiu createEntity];
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    objectiu.value = [f numberFromString:self.quantitat.text];
    
    [[NSManagedObjectContext defaultContext]save];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
