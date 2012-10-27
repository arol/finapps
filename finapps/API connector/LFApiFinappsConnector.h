//
//  LFApiFinappsConnector.h
//  finapps
//
//  Created by David Cortés Fulla on 26/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import "AFHTTPClient.h"

@interface LFApiFinappsConnector : AFHTTPClient

+ (LFApiFinappsConnector *)sharedClient;
- (id)initWithBaseURL:(NSURL *)url;

//@property (nonatomic,strong) NSString *

@end
