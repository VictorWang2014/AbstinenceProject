//
//  DZHMinuteMoreView.m
//  DzhProjectiPhone
//
//  Created by wangmingquan on 2017/12/13.
//  Copyright © 2017年 gw. All rights reserved.
//

#import "DZHMinuteMoreView.h"
#import "CustomTableViewCell.h"
#import "OneCollectionTableViewCell.h"

@interface DZHMinuteMoreView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray <id<CellItemProtocol>>*listArray;

@property (nonatomic, strong) UITableView *tableView;

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
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OneCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OneCollectionTableViewCell class])];
    if (cell == nil) {
        cell = [[OneCollectionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([OneCollectionTableViewCell class])];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count+1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [self.listArray objectAtIndex:indexPath.row].CellHeight;
    return 100;
}

@end


@interface DZHMinuteTableViewCell () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
//@property (nonatomic, assign) int

@end

@implementation DZHMinuteTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UICollectionViewFlowLayout *collectionLayout = [[UICollectionViewFlowLayout alloc] init];
        collectionLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        collectionLayout.minimumLineSpacing = 0;
        collectionLayout.minimumInteritemSpacing = 0;
        self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:collectionLayout];
        self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self addSubview:self.collectionView];
        [self.collectionView registerClass:[DZHMinuteCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([DZHMinuteCollectionViewCell class])];
    }
    return self;
}

#pragma mark - UICollectionView
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DZHMinuteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([DZHMinuteCollectionViewCell class]) forIndexPath:indexPath];
    cell.titleString = [NSString stringWithFormat:@"%ld-%ld", indexPath.row, indexPath.section];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(40, self.frame.size.height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didselect at indexPath %ld %ld", indexPath.section, indexPath.row);
}

@end

@interface DZHMinuteCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation DZHMinuteCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.label.textColor = [UIColor redColor];
        [self addSubview:self.label];
    }
    return self;
}

- (void)setTitleString:(NSString *)titleString {
    if (_titleString != titleString) {
        _titleString = titleString;
        self.label.text = titleString;
    }
}

@end


