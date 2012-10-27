//
//  CompteCorrent+Functions.h
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "CompteCorrent.h"

typedef void (^ErrorBlock)(NSError* error);
typedef void (^SuccessListBlock)(NSArray *comptesCorrents);
typedef void (^SuccessElem)(CompteCorrent *compteCorrent);

@interface CompteCorrent (Functions)

+ (void) findAllComptesCorrentsWith:(SuccessListBlock)okResponse errorResponse:(ErrorBlock)errorResponse;

-(void)checkIfIsSavingsAccount;

+ (CompteCorrent*)savingsAccount;

+ (CompteCorrent*)regularAccount;

@end
