//
//  RankCollectionViewGuessCell.m
//  MSFaces
//
//  Created by Lee on 10/5/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import "RankCollectionViewGuessCell.h"

@implementation RankCollectionViewGuessCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.imageView.layer.cornerRadius = 40;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.imageView.layer.cornerRadius = 40;
    }
    return self;
}

@end
