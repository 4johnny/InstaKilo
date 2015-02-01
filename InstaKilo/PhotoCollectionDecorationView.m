//
//  PhotoCollectionDecorationView.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "PhotoCollectionDecorationView.h"


#
# pragma mark - Constants
#


#define PHOTO_COLLECTION_DECORATION_VIEW_KIND @"PhotoCollectionDecorationView"

#define BACKGROUND_COLOR_PATTERN_IMAGE @"floral_motif_2"


#
# pragma mark - Implementation
#


@implementation PhotoCollectionDecorationView


#
# pragma mark UIView
#


- (instancetype)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:BACKGROUND_COLOR_PATTERN_IMAGE]];
	}
	
	return self;
}


#
# pragma mark Helpers
#


+ (NSString*)kind {
	
	return (NSString*)PHOTO_COLLECTION_DECORATION_VIEW_KIND;
}


@end
