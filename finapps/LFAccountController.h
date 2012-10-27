//
//  LFAccountController.h
//  finapps
//
//  Created by Arol Viñolas on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operacio+Functions.h"

@interface LFAccountController : NSObject

+(LFAccountController*) sharedAccountController;

- (void)evaluateOperations:(NSArray*)operations;
- (NSNumber*)pressupostMensual;
- (NSNumber*)pressupostDiari;

- (NSNumber*)despesaActual;

- (NSNumber*)despesesDiaries;
- (NSNumber*)despesesMensuals;



@property (nonatomic,strong) NSNumber *ingresos;
@property (nonatomic,strong) NSNumber *despesesFixes;



@end
