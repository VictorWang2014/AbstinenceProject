//
//  DZHMinuteMoreView.h
//  DzhProjectiPhone
//
//  Created by wangmingquan on 2017/12/13.
//  Copyright © 2017年 gw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MinuteMoreData <NSObject>

@property (nonatomic, strong) NSMutableArray *listArray;

@end

@interface DZHMinuteMoreView : UIView

@end

@interface DZHMinuteConfigCell : UICollectionViewCell

@property (nonatomic, strong) NSString *titleString;

@end
