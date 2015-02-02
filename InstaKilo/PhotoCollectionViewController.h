//
//  PhotoCollectionViewController.h
//  InstaKilo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotosModel.h"


@interface PhotoCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

@property (nonatomic) PhotosModel* photosModel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *sectionTypeSegmentedControl;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *photosTapGestureRecognizer;

@end
