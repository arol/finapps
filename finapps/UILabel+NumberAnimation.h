//
//  UITextField+NumberAnimation.h
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (NumberAnimation)

- (void) animateTextFromZeroTo:(int)target andFormat:(NSString *)format duration:(float)duration;

@property (nonatomic,assign) int acumulat;

@end
