//
//  Repte.h
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Categoria, Usuari;

@interface Repte : NSManagedObject

@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSNumber * value;
@property (nonatomic, retain) Categoria *categoria;
@property (nonatomic, retain) Usuari *usuari;

@end
