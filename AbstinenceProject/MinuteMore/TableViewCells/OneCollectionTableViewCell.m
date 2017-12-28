//
//  OneCollectionTableViewCell.m
//  AbstinenceProject
//
//  Created by wangmingquan on 2017/12/25.
//  Copyright © 2017年 wangmingquan. All rights reserved.
//

#import "OneCollectionTableViewCell.h"
#import "OneCollectionLayout.h"

@interface OneCollectionTableViewCell () <UICollectionViewDelegate, UICollectionViewDataSource> {
    UICollectionView *_collectionView;
}


@end

@implementation OneCollectionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        OneCollectionLayout *layout = [[OneCollectionLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.contentView addSubview:_collectionView];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    }
    return self;
}

#pragma mark - UICollectionViewDelegate UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
    label.text = [NSString stringWithFormat:@"%ld_%ld", indexPath.row, indexPath.section];
    label.backgroundColor = [UIColor redColor];
    [cell addSubview:label];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

@end
