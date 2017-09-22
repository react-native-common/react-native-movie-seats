//
//  RNMovieSeatsManager.m
//  RNMovieSeats
//
//  Created by Ashoka on 20/09/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "RNMovieSeatsManager.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTUIManager.h>
#import "RNMovieSeats.h"

@implementation RNMovieSeatsManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)

RCT_CUSTOM_VIEW_PROPERTY(maxSelectedSeatsCount, NSNumber, RNMovieSeats) {
    [view setMaxSelectedSeatsCount:[json integerValue]];
}

RCT_CUSTOM_VIEW_PROPERTY(width, NSNumber, RNMovieSeats) {
    [view setRctWidth:[json floatValue]];
}

RCT_CUSTOM_VIEW_PROPERTY(height, NSNumber, RNMovieSeats) {
    [view setRctHeight:[json floatValue]];
}

RCT_CUSTOM_VIEW_PROPERTY(seatInfos, NSDictionary, RNMovieSeats) {
//    [view setSeatsArray:json];
    NSLog(@"seatInfos: %@", json);
}

- (UIView *)view
{
    return [RNMovieSeats new];
}

RCT_EXPORT_METHOD(setupViews:(nonnull NSNumber *)reactTag) {
    [self.bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, NSDictionary<NSNumber *, RNMovieSeats *> *viewRegistry) {
        RNMovieSeats *view = viewRegistry[reactTag];
        if (![view isKindOfClass:[RNMovieSeats class]]) {
            RCTLogError(@"Invalid view returned from registry, expecting RNMovieSeats, got: %@", view);
        } else {
            [view setupView];
        }
    }];
}

@end
