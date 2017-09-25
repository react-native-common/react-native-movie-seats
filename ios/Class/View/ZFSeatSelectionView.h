//
//  ZFSeatSelectionView.h
//  ZFSeatSelection
//
//  Created by qq 316917975  on 16/7/9.
//  gitHub地址：https://github.com/ZFbaby
//  后面还会增加多种样式（格瓦拉，淘票票，微票儿）实现UI可定制效果及开场动画样式，请关注更新！记得点星哦！！！

#import <UIKit/UIKit.h>
#import "ZFSeatButton.h"
#import "ZFSeatSelectionConfig.h"

@interface ZFSeatSelectionView : UIView

/**frame 初始化必需设置你的frame  seatsArray座位数组    hallName影厅名称   actionBlock按钮点击回调－>传回就是选中的按钮数组和全部可选按钮*/

-(instancetype)initWithFrame:(CGRect)frame
                  SeatsArray:(NSMutableArray *)seatsArray
                    HallName:(NSString *)hallName
          seatBtnActionBlock:(void(^)(NSString *, NSString *, ActionType))actionBlock;

/**
 限制最大选座数量
*/
@property (nonatomic, assign) NSInteger maxSelectedSeatsCount;

/**已经选择的按钮数组*/
@property (nonatomic, strong) NSMutableArray *selecetedSeats;

- (void)clearAllSelectedSeats;

- (void)setRow:(NSString *)row column:(NSString *)column selected:(BOOL)select;

@end
