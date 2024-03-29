//
//  Operacio+Functions.m
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "Operacio+Functions.h"
#import "LFApiFinappsConnector.h"

#import "LFAccountController.h"

@implementation Operacio (Functions)

+ (void) findAllOperacionsInAccount:(NSString *)accountId With:(OperationSuccessListBlock)okResponse errorResponse:(OperationErrorBlock)errorResponse
{
    NSString *userToken = @"49e-a84e-94dbd5554aa2";
    
    LFApiFinappsConnector *client = [LFApiFinappsConnector sharedClient];
    
    [client getPath:[NSString stringWithFormat:@"%@/operations/account/%@/operations",userToken,accountId]
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id JSON) {
                NSMutableArray *operacions = [[NSMutableArray alloc] init];
                for (NSDictionary* operacioDictionary in [JSON valueForKey:@"data"]) {
                    Operacio *operacio = [Operacio createObjectWithParameters:operacioDictionary];
                    [operacions addObject:operacio];
                }
                [[NSManagedObjectContext defaultContext] save];
                
                [[LFAccountController sharedAccountController] evaluateOperations:operacions];
                
                if (okResponse){
                    NSArray *ops = [NSArray arrayWithArray:operacions];
                    okResponse(ops);
                }
                
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
                if (errorResponse){
                    errorResponse(error);
                }
            }];
}

+ (Operacio *)createObjectWithParameters:(NSDictionary *)JSON
{
    Operacio *op = [Operacio findFirstByAttribute:@"ident" withValue:[JSON valueForKey:@"id"]];
    if (!op){
        op = [Operacio createEntity];
        op.ident = [JSON valueForKey:@"id"];
        op.concept = [JSON valueForKeyPath:@"concept"];
        op.value = [JSON valueForKeyPath:@"value"];
        op.type = [JSON valueForKeyPath:@"type"];
    }
    return op;
}

@end
