
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <UIKit/UIKit.h>
#import <React/UIView+React.h>
#import "ZFSeatSelectionView.h"

@interface RNMovieSeats : UIView

@property (nonatomic, strong) ZFSeatSelectionView* selectSeatsView;

@property (nonatomic, assign) float rctWidth;
@property (nonatomic, assign) float rctHeight;
@property (nonatomic, strong) NSMutableArray *seatsArray;
@property (nonatomic, copy) RCTBubblingEventBlock onChange;
@property (nonatomic, strong) NSArray *selectedSeats;

/**影厅名称*/
@property (nonatomic, strong) NSString *hallName;

/**
 限制最大选座数量
 */
@property (nonatomic, assign) NSInteger maxSelectedSeatsCount;

- (void)setupView;

@end
  
