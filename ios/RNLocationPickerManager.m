//
//  RNLocationPickerManager.m
//  tacitus
//
//  Created by Jack Chang on 3/8/2016.
//  Copyright © 2016 Jack Chang. All rights reserved.
//

#import "RNLocationPickerManager.h"
#import "RCTLog.h"
#import "RCTEventDispatcher.h"
#import "tacitus-Swift.h"

NSString *LocationDidSelectNotification = @"LocationDidSelect";


@implementation RNLocationPickerManager

RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onLocationDidSelect:) name:LocationDidSelectNotification object:nil];
    }
    return self;
}

- (void)onLocationDidSelect:(NSNotification *)notification
{
    // NSLog(@"RNLocationPicker getActiveInstance name %@", [[RNLocationPicker getActiveInstance] locationObject][@"name"]);
    [self.bridge.eventDispatcher sendAppEventWithName:@"locationDidSelect"
                                                 body:notification.object];
}

@end
