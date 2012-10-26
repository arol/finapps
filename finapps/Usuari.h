//
//  Usuari.h
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Repte;

@interface Usuari : NSManagedObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * ident;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * firstname;
@property (nonatomic, retain) NSString * lastname;
@property (nonatomic, retain) NSString * street;
@property (nonatomic, retain) NSString * addressNumber;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * postalCode;
@property (nonatomic, retain) NSString * county;
@property (nonatomic, retain) NSSet *reptes;
@property (nonatomic, retain) NSManagedObject *comptes;
@end

@interface Usuari (CoreDataGeneratedAccessors)

- (void)addReptesObject:(Repte *)value;
- (void)removeReptesObject:(Repte *)value;
- (void)addReptes:(NSSet *)values;
- (void)removeReptes:(NSSet *)values;

@end
