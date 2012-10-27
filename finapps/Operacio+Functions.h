//
//  Operacio+Functions.h
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "Operacio.h"

// enum [“DEPOSIT”|”CHARGE”|”PAYROLL”|”TRANSFER”]
#define OperacioTypeDeposit     @"DEPOSIT"
#define OperacioTypeCharge      @"CHARGE"
#define OperacioTypePayroll     @"PAYROLL"
#define OperacioTypeTransfer    @"TRANSFER"


typedef void (^OperationErrorBlock)(NSError* error);
typedef void (^OperationSuccessListBlock)(NSArray *operacions);
typedef void (^OperationSuccessElem)(Operacio *operacio);

@interface Operacio (Functions)

+ (void) findAllOperacionsInAccount:(NSString *)accountId With:(OperationSuccessListBlock)okResponse errorResponse:(OperationErrorBlock)errorResponse;

@end
