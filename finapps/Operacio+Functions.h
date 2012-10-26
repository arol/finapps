//
//  Operacio+Functions.h
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "Operacio.h"

typedef void (^OperationErrorBlock)(NSError* error);
typedef void (^OperationSuccessListBlock)(NSArray *operacions);
typedef void (^OperationSuccessElem)(Operacio *operacio);

@interface Operacio (Functions)

+ (void) findAllOperacionsInAccount:(NSString *)accountId With:(OperationSuccessListBlock)okResponse errorResponse:(OperationErrorBlock)errorResponse;

@end
