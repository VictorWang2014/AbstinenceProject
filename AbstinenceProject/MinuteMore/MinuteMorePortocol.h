//
//  MinuteMorePortocol.h
//  AbstinenceProject
//
//  Created by wangmingquan on 2017/12/13.
//  Copyright © 2017年 wangmingquan. All rights reserved.
//


@protocol MinuteMoreData <NSObject>

@property (nonatomic, strong) NSMutableArray *listArray;

@end

@protocol CellItemProtocol <NSObject>

@property (nonatomic, assign) CGFloat CellHeight;

@property (nonatomic, retain) Class TableCellClass;

@end
