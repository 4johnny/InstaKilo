//
//  PhotoCollectionViewController.h
//  InstaKilo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

@property (nonatomic) NSArray* photosWork;
@property (nonatomic) NSArray* photosPlay;

@end
