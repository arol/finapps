//
//  LFAccountController.m
//  finapps
//
//  Created by Arol Viñolas on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFAccountController.h"

#import "CompteCorrent+Functions.h"
#import "Operacio+Functions.h"
#import "Categoria.h"

@implementation LFAccountController

+ (LFAccountController *) sharedAccountController {
    static LFAccountController *_sharedAccountController = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedAccountController = [[LFAccountController alloc] init];
    });
    
    return _sharedAccountController;
}

- (void)evaluateOperations:(NSArray*)operations{
    NSNumber* ingresosCount = @0;
    NSNumber* despesesCount = @0;
    
    NSArray *operacionsCoreData = [Operacio findAll];
    if([operacionsCoreData count] > 0){
        operations = operacionsCoreData;
    }
    
    for(Operacio *operacio in operations){
        Categoria *categoria = [operacio categoria];
        
        if ([[operacio type] isEqualToString:OperacioTypePayroll]) {
            ingresosCount = [NSNumber numberWithFloat:([ingresosCount floatValue] + [[operacio value] floatValue])];
        } else if(categoria) {
            
            if([categoria isRecursive]){
                // Les despeses es compten en negatiu
                despesesCount = [NSNumber numberWithFloat:([despesesCount floatValue] + [[operacio value] floatValue])];
            }
        }
    }
    
    [self setIngresos:ingresosCount];
    [self setDespesesFixes:despesesCount];
}

- (NSNumber*)pressupostMensual{
    return [NSNumber numberWithFloat:([self.ingresos floatValue] - [self.despesesFixes floatValue])];
}

- (NSNumber*)pressupostDiari{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange rng = [cal rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:[NSDate date]];
    NSUInteger numberOfDaysInMonth = rng.length;
    
    return [NSNumber numberWithFloat:([[self pressupostMensual] floatValue]/numberOfDaysInMonth)];
}


-(NSNumber*)despesesDiaries{
    return @52;
}

-(NSNumber*)despesesMensuals{
    return @2000;
}

@end
