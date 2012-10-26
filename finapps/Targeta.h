//
//  Targeta.h
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CompteCorrent;

@interface Targeta : NSManagedObject

@property (nonatomic, retain) NSNumber * creditAvailable;
@property (nonatomic, retain) NSNumber * creditLimit;
@property (nonatomic, retain) NSDate * deprecateDate;
@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSString * ident;
@property (nonatomic, retain) NSNumber * interestRate;
@property (nonatomic, retain) NSString * issuer;
@property (nonatomic, retain) NSString * mode;
@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSString * securityCode;
@property (nonatomic, retain) NSNumber * totalDebt;
@property (nonatomic, retain) CompteCorrent *compte;

@end
