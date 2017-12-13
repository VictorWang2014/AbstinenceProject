//
//  DZHMinuteMoreView.m
//  DzhProjectiPhone
//
//  Created by wangmingquan on 2017/12/13.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "DZHMinuteMoreView.h"

@interface DZHMinuteMoreView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray <id<MinuteMoreData>>*listArray;

@end

@implementation DZHMinuteMoreView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self initialView];
}

- (void)initialView {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat originY = 0;
    for (int i = 0; i < 2; i++) {
        CGFloat height = self.frame.size.height/2;
        UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc] init];
        collectionLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        collectionLayout.minimumLineSpacing = 0;
        collectionLayout.minimumInteritemSpacing = 0;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, originY, self.frame.size.width, height) collectionViewLayout:collectionLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.tag = i;
        [self addSubview:collectionView];
        [collectionView registerClass:[DZHMinuteConfigCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([DZHMinuteConfigCell class])];
    }
}

#pragma mark - UICollectionView
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DZHMinuteConfigCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DZHMinuteConfigCell class]) forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    id<MinuteMoreData> moreData = [self.listArray objectAtIndex:collectionView.tag];
    return moreData.listArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(40, 40);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end

@interface DZHMinuteConfigCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation DZHMinuteConfigCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:label];
    }
    return self;
}

- (void)setTitleString:(NSString *)titleString {
    if (_titleString != titleString) {
        _titleString = titleString;
        
    }
}

@end
