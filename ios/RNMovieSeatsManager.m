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

RCT_EXPORT_VIEW_PROPERTY(hallName, NSString)

RCT_CUSTOM_VIEW_PROPERTY(maxSelectedSeatsCount, NSNumber, RNMovieSeats) {
    [view setMaxSelectedSeatsCount:[json integerValue]];
}

RCT_CUSTOM_VIEW_PROPERTY(seatInfos, NSDictionary, RNMovieSeats) {
    NSLog(@"seatInfos: %@", json);
    if (json) {
        NSArray *rows = [json objectForKey:@"row"];
        NSArray *seats = [json objectForKey:@"seat"];
        NSMutableArray *seatsArray = @[].mutableCopy;
        for (int i = 0; i < seats.count; i++) {
            ZFSeatsModel *seatsModel = [[ZFSeatsModel alloc] init];
            seatsModel.rowId = rows[i];
            seatsModel.rowNum = @(i + 1);
            NSMutableArray *columns = @[].mutableCopy;
            for (NSDictionary *seatDict in seats[i]) {
                ZFSeatModel *seatModel = [ZFSeatModel new];
                seatModel.st = [seatDict objectForKey:@"seatType"];
                seatModel.columnId = [seatDict objectForKey:@"column"];
                seatModel.seatNo = [NSString stringWithFormat:@"%@_%@", seatsModel.rowId, seatModel.columnId];
                [columns addObject:seatModel];
            }
            seatsModel.columns = columns;
            [seatsArray addObject:seatsModel];
        }
        [view setSeatsArray:seatsArray];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(width, NSNumber, RNMovieSeats) {
    [view setRctWidth:[json floatValue]];
}

RCT_CUSTOM_VIEW_PROPERTY(height, NSNumber, RNMovieSeats) {
    [view setRctHeight:[json floatValue]];
}

RCT_EXPORT_VIEW_PROPERTY(selectedSeats, NSArray)

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
