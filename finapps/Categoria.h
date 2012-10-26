//
//  Categoria.h
//  finapps
//
//  Created by Arol Viñolas on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Operacio, Repte;

@interface Categoria : NSManagedObject

@property (nonatomic, retain) NSString * ident;
@property (nonatomic, retain) NSString * nom;
@property (nonatomic, retain) NSNumber * isRecursive;
@property (nonatomic, retain) NSSet *productes;
@property (nonatomic, retain) Repte *repte;
@end

@interface Categoria (CoreDataGeneratedAccessors)

- (void)addProductesObject:(Operacio *)value;
- (void)removeProductesObject:(Operacio *)value;
- (void)addProductes:(NSSet *)values;
- (void)removeProductes:(NSSet *)values;

@end
