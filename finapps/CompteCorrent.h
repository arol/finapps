//
//  CompteCorrent.h
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Operacio, Targeta, Usuari;

@interface CompteCorrent : NSManagedObject

@property (nonatomic, retain) NSString * ident;
@property (nonatomic, retain) NSString * office;
@property (nonatomic, retain) NSString * accountNumber;
@property (nonatomic, retain) NSString * iban;
@property (nonatomic, retain) NSString * currency;
@property (nonatomic, retain) NSNumber * availableBalance;
@property (nonatomic, retain) NSNumber * retainedBalance;
@property (nonatomic, retain) NSNumber * actualBalance;
@property (nonatomic, retain) NSSet *targetes;
@property (nonatomic, retain) NSSet *operacions;
@property (nonatomic, retain) Usuari *usuari;
@end

@interface CompteCorrent (CoreDataGeneratedAccessors)

- (void)addTargetesObject:(Targeta *)value;
- (void)removeTargetesObject:(Targeta *)value;
- (void)addTargetes:(NSSet *)values;
- (void)removeTargetes:(NSSet *)values;

- (void)addOperacionsObject:(Operacio *)value;
- (void)removeOperacionsObject:(Operacio *)value;
- (void)addOperacions:(NSSet *)values;
- (void)removeOperacions:(NSSet *)values;

@end
