//
//  LFLoginViewController.m
//  finapps
//
//  Created by Arol Viñolas on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFLoginViewController.h"
#import "LFApiFinappsConnector.h"

@interface LFLoginViewController ()

@end

@implementation LFLoginViewController

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

-(IBAction)login:(id)sender{
    [[LFApiFinappsConnector sharedClient] setAuthorizationHeaderWithUsername:[self.usernameTextField text] password:[self.passwordTextField text]];
    [[LFApiFinappsConnector sharedClient] getPath:@"access/login"
                                       parameters:nil
                                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                              
                                              [self getAccounts];
                                          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                              [[UIAlertView alloc] initWithTitle:@"Error" message:@"Credencials incorrectes"
                                                                        delegate:nil cancelButtonTitle:@"Tornar a intentar" otherButtonTitles: nil];
                                          }];
}

-(void)getAccounts{
    
}


@end
