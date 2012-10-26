//
//  LFApiFinappsConnector.m
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFApiFinappsConnector.h"
#import "AFJSONRequestOperation.h"

static NSString * const kAPIFinAppsConnector = @"http://finappsapi.bdigital.org/api/2012/d496e7aaa1/";

@implementation LFApiFinappsConnector

+ (LFApiFinappsConnector *)sharedClient {
    static LFApiFinappsConnector *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LFApiFinappsConnector alloc] initWithBaseURL:[NSURL URLWithString:kAPIFinAppsConnector]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    
    return self;
}



@end
