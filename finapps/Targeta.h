//
//  Targeta.h
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Targeta : NSManagedObject

@property (nonatomic, retain) NSString * ident;
@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSDate * deprecateDate;
@property (nonatomic, retain) NSString * securityCode;
@property (nonatomic, retain) NSString * mode;
@property (nonatomic, retain) NSString * issuer;
@property (nonatomic, retain) NSNumber * creditLimit;
@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSNumber * totalDebt;
@property (nonatomic, retain) NSNumber * creditAvailable;
@property (nonatomic, retain) NSNumber * interestRate;
@property (nonatomic, retain) NSManagedObject *compte;

@end
