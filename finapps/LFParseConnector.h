//
//  LFParseConnector.h
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "AFHTTPClient.h"

@interface LFParseConnector : AFHTTPClient

+ (LFParseConnector *)sharedClient;
- (id)initWithBaseURL:(NSURL *)url;

+ (NSString *)stringQueryForParameters:(NSDictionary*)parameters;

@end
