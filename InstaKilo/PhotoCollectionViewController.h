//
//  PhotoCollectionViewController.h
//  InstaKilo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"


@interface PhotoCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

@property (nonatomic) Model* model;

@property (nonatomic) NSString* sectionType;

@property (weak, nonatomic) IBOutlet UISegmentedControl *sectionTypeSegmentedControl;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *photosTapGestureRecognizer;

@end
