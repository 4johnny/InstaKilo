//
//  PhotoCollectionDecorationView.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "PhotoCollectionDecorationView.h"


#define PHOTO_COLLECTION_DECORATION_VIEW_KIND @"PhotoCollectionDecorationView"


@implementation PhotoCollectionDecorationView


- (id)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	if (self) {
		
		[self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"floral_motif_1"]]];
	}
	
	return self;
}


+ (NSString*)kind {
	
	return (NSString*)PHOTO_COLLECTION_DECORATION_VIEW_KIND;
}


@end
