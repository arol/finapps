//
//  LFApiFinappsConnector.h
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPClient.h"

@interface LFApiFinappsConnector : AFHTTPClient

+ (LFApiFinappsConnector *)sharedClient;
- (id)initWithBaseURL:(NSURL *)url;

@end
