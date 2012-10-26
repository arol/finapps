//
//  CompteEstalvi.h
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Objectiu;

@interface CompteEstalvi : NSManagedObject

@property (nonatomic, retain) Objectiu *objectiu;

@end
