//
//  UILabel+NumberAnimation.m
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "UILabel+NumberAnimation.h"

#define TIME_OF_TRANSITION 0.030

@implementation UILabel (NumberAnimation)

- (void) animateTextFromZeroTo:(int)target andFormat:(NSString *)format duration:(float)duration
{
    [self animateTextFromZeroTo:target acumulat:0 andFormat:format duration:duration];
}

- (void) animateTextFromZeroTo:(int)target acumulat:(int)acumulat andFormat:(NSString *)format duration:(float)duration
{
    if (acumulat  >= target){
        self.text = [NSString stringWithFormat:format];
        return;
    }
    
    int numberOfCalls = [self numberOfCallsForDuration:duration];
    acumulat += target / numberOfCalls;
    self.text = [NSString stringWithFormat:format,acumulat];
    NSMutableDictionary *variables = [NSMutableDictionary dictionaryWithDictionary:@{@"target" : [NSNumber numberWithInt:target], @"acumulat" : [NSNumber numberWithInt:acumulat],@"format" : format, @"duration" : [NSNumber numberWithFloat:duration]}];
    [self performSelector:@selector(animateTextWithDictionary:) withObject:variables afterDelay:TIME_OF_TRANSITION];
}

- (void) animateTextWithDictionary:(NSMutableDictionary *)variables
{
    int acumulat = [[variables valueForKey:@"acumulat"] intValue];
    float duration = [[variables valueForKey:@"duration"] floatValue];
    int target = [[variables valueForKey:@"target"] intValue];
    NSString *format = [variables valueForKey:@"format"];
    
    if (acumulat  >= target){
        self.text = [NSString stringWithFormat:@"%i €",target];
        return;
    }
    
    int numberOfCalls = [self numberOfCallsForDuration:duration];
    acumulat += target / numberOfCalls;
    self.text = [NSString stringWithFormat:format,acumulat];
    [variables setValue:[NSNumber numberWithInt:acumulat] forKey:@"acumulat"];
    [self performSelector:@selector(animateTextWithDictionary:) withObject:variables afterDelay:TIME_OF_TRANSITION];
}

- (float) numberOfCallsForDuration:(float)duration
{
    return (float)(duration / TIME_OF_TRANSITION);
}

@end
