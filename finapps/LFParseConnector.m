//
//  LFParseConnector.m
//  finapps
//
//  Created by Arol Viñolas on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "LFParseConnector.h"
#import "AFJSONRequestOperation.h"

static NSString * const kParseConnector = @"https://api.parse.com/1/";
static NSString * const kParseAppID = @"dQtYSdg2rIkwlHHtIzCNmMxSyll9vhIc2eVrJHj3";
static NSString * const kParseAPIKey = @"fktO59z6fyt6oqMsTqPCTfwK9pEiYuBGz7TZv5Sh";

@implementation LFParseConnector

+ (LFParseConnector *)sharedClient {
    static LFParseConnector *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LFParseConnector alloc] initWithBaseURL:[NSURL URLWithString:kParseConnector]];
        [_sharedClient setDefaultHeader:@"X-Parse-Application-Id" value:@"dQtYSdg2rIkwlHHtIzCNmMxSyll9vhIc2eVrJHj3"];
        [_sharedClient setDefaultHeader:@"X-Parse-REST-API-Key" value:@"fktO59z6fyt6oqMsTqPCTfwK9pEiYuBGz7TZv5Sh"];
        
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

+(NSString *)stringQueryForParameters:(NSDictionary *)parameters{
    NSString *query = @"{";
    BOOL first = YES;
    
    for(NSString* key in parameters){
        if(!first){
            query = [query stringByAppendingFormat:@","];
        }
        query = [query stringByAppendingFormat:@"\"%@\":\"%@\"", key, [parameters objectForKey:key]];
    }

    query = [query stringByAppendingFormat:@"}"];
    
    return query;
}

@end
