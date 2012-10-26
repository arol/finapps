//
//  Operacio.h
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Categoria;

@interface Operacio : NSManagedObject

@property (nonatomic, retain) NSString * ident;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSString * concept;
@property (nonatomic, retain) NSString * descript;
@property (nonatomic, retain) NSNumber * value;
@property (nonatomic, retain) NSNumber * actualBalance;
@property (nonatomic, retain) NSString * options;
@property (nonatomic, retain) Categoria *categoria;
@property (nonatomic, retain) NSManagedObject *compte;

@end
