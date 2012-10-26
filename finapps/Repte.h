//
//  Repte.h
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Repte : NSManagedObject

@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSNumber * value;
@property (nonatomic, retain) NSManagedObject *categoria;
@property (nonatomic, retain) NSManagedObject *usuari;

@end
