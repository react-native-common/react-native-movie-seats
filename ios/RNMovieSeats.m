
#import "RNMovieSeats.h"
#import "ZFSeatsView.h"
#import "MJExtension.h"

@implementation RNMovieSeats

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.hallName = @"银幕";
    return self;
}

- (void)setupView {
    if(!_selectSeatsView && self.seatsArray.count > 0) {
        __weak typeof(self) weakSelf = self;
        CGRect frame = [UIScreen mainScreen].bounds;
        if (self.rctWidth == 0 || self.rctHeight == 0) {
            self.rctWidth = frame.size.width;
            self.rctHeight = self.rctWidth * 0.8;
        }
        _selectSeatsView = [[ZFSeatSelectionView alloc] initWithFrame:CGRectMake(0, 0, self.rctWidth, self.rctHeight) SeatsArray:self.seatsArray HallName:self.hallName seatBtnActionBlock:^(NSString *row, NSString *column, ActionType actionType) {
            NSDictionary *types = @{
                                    @(kSelect).stringValue: @"select",
                                    @(kUnSelect).stringValue: @"unselect",
                                    @(kError).stringValue: @"error"
                                    };
            NSString *type = types[@(actionType).stringValue];
            if (actionType == kError) {
                
            }
            if (weakSelf.onChange) {
                weakSelf.onChange(@{
                                    @"type": type,
                                    @"data": @{@"row":@(row.integerValue), @"col":@(column.integerValue)}
                                    });
            }
        }];
        if (self.maxSelectedSeatsCount > 0)
            _selectSeatsView.maxSelectedSeatsCount = self.maxSelectedSeatsCount;
        [self addSubview:_selectSeatsView];
        /** 重新设置下选中座位，因为之前selctSeatsView还没创建 */
        [self setSelectedSeats:self.selectedSeats];
    }
}

- (void)setSelectedSeats:(NSArray *)selectedSeats {
    _selectedSeats = selectedSeats;
    [self.selectSeatsView clearAllSelectedSeats];
    for (NSDictionary *seat in selectedSeats) {
        NSString *row = [[seat objectForKey:@"row"] stringValue];
        NSString *column = [[seat objectForKey:@"col"] stringValue];
        [self.selectSeatsView setRow:row column:column selected:YES];
    }
}

- (void)setSeatsArray:(NSMutableArray *)seatsArray {
    _seatsArray = seatsArray;
    if (_selectSeatsView) {
        [_selectSeatsView removeFromSuperview];
        _selectSeatsView = nil;
        [self setupView];
    }
}

- (void)setMaxSelectedSeatsCount:(NSInteger)maxSelectedSeatsCount {
    _maxSelectedSeatsCount = maxSelectedSeatsCount;
    self.selectSeatsView.maxSelectedSeatsCount = maxSelectedSeatsCount;
}

@end

