//
//  CompteCorrent.h
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Objectiu, Operacio, Targeta, Usuari;

@interface CompteCorrent : NSManagedObject

@property (nonatomic, retain) NSString * accountNumber;
@property (nonatomic, retain) NSNumber * actualBalance;
@property (nonatomic, retain) NSNumber * availableBalance;
@property (nonatomic, retain) NSString * currency;
@property (nonatomic, retain) NSString * iban;
@property (nonatomic, retain) NSString * ident;
@property (nonatomic, retain) NSString * office;
@property (nonatomic, retain) NSNumber * retainedBalance;
@property (nonatomic, retain) NSNumber *isEstalvi;
@property (nonatomic, retain) NSSet *operacions;
@property (nonatomic, retain) NSSet *targetes;
@property (nonatomic, retain) Usuari *usuari;
@property (nonatomic, retain) Objectiu *objectiu;
@end

@interface CompteCorrent (CoreDataGeneratedAccessors)

- (void)addOperacionsObject:(Operacio *)value;
- (void)removeOperacionsObject:(Operacio *)value;
- (void)addOperacions:(NSSet *)values;
- (void)removeOperacions:(NSSet *)values;

- (void)addTargetesObject:(Targeta *)value;
- (void)removeTargetesObject:(Targeta *)value;
- (void)addTargetes:(NSSet *)values;
- (void)removeTargetes:(NSSet *)values;

@end
