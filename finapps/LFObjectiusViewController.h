//
//  LFObjectiusViewController.h
//  finapps
//
//  Created by David Cortés Fulla on 27/10/12.
//  Copyright (c) 2012 Lafosca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CERoundProgressView.h"

@interface LFObjectiusViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
    @property (nonatomic,weak) IBOutlet CERoundProgressView *progressView;
@end
