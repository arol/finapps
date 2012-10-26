//
//  CompteCorrent+Functions.m
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "CompteCorrent+Functions.h"
#import "LFApiFinappsConnector.h"

@implementation CompteCorrent (Functions)

+ (void) findAllComptesCorrentsWith:(SuccessListBlock)okResponse errorResponse:(ErrorBlock)errorResponse
{    
    NSString *userToken = @"49e-a84e-94dbd5554aa2";
    
    LFApiFinappsConnector *client = [LFApiFinappsConnector sharedClient];
    
    [client getPath:[NSString stringWithFormat:@"%@/operations/account/list",userToken]
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id JSON) {
                NSMutableArray *comptesCorrents = [[NSMutableArray alloc] init];
                for (NSString *account_id in [JSON valueForKey:@"data"]) {
                    [CompteCorrent findByIdentifier:account_id okResponse:^(CompteCorrent *compteCorrent) {
                        NSLog(@"%i",[[JSON valueForKey:@"data"]count]);
                        [comptesCorrents addObject:compteCorrent];
                        if (okResponse && [[JSON valueForKey:@"data"]count] ==  [comptesCorrents count]){
                            NSArray *ccs = [NSArray arrayWithArray:comptesCorrents];
                            okResponse(ccs);
                        }
                        
                    } errorResponse:^(NSError *error) {
                        NSLog(@"%@",error);
                    }];
                } ;
              
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
                if (errorResponse){
                    errorResponse(error);
                }
            }];
}

+ (void) findByIdentifier:(NSString *)account_id okResponse:(SuccessElem)okResponse errorResponse:(ErrorBlock)errorResponse
{
    NSString *userToken = @"49e-a84e-94dbd5554aa2";
    
    LFApiFinappsConnector *client = [LFApiFinappsConnector sharedClient];
    
    [client getPath:[NSString stringWithFormat:@"%@/operations/account/%@",userToken,account_id]
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id JSON) {
                CompteCorrent *cc = [CompteCorrent createObjectWithParameters:(NSDictionary *)JSON];
                okResponse(cc);
            }
            failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
                if (errorResponse){
                    errorResponse(error);
                }
            }];
}

+ (CompteCorrent *)createObjectWithParameters:(NSDictionary *)JSON
{
    CompteCorrent *cc = [CompteCorrent createEntity];
    cc.accountNumber = [JSON valueForKeyPath:@"data.accountNumber"];
    cc.actualBalance = [JSON valueForKeyPath:@"data.actualBalance"];
    cc.availableBalance = [JSON valueForKeyPath:@"data.availableBalance"];
    cc.currency = [JSON valueForKeyPath:@"data.currency"];
    cc.iban = [JSON valueForKeyPath:@"data.iban"];
    cc.ident = [JSON valueForKeyPath:@"data.id"];
    cc.office = [JSON valueForKeyPath:@"data.office"];
    cc.retainedBalance = [JSON valueForKeyPath:@"data.retainedBalance"];
#warning isEstalvi al parse
    cc.isEstalvi = NO;
#warning S'han de fer relacions, aqui o mes tard?
    cc.operacions = nil;
    cc.targetes = nil;
    cc.usuari = nil;
    cc.objectiu = nil;
    return cc;
}

@end
