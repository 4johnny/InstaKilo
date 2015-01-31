//
//  PhotoCollectionViewFlowLayout.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "PhotoCollectionViewFlowLayout.h"
#import "PhotoCollectionDecorationView.h"


@implementation PhotoCollectionViewFlowLayout


- (instancetype)init {
	
	self = [super init];
	if (self) {
		
		[self registerClass:PhotoCollectionDecorationView.class forDecorationViewOfKind:PhotoCollectionDecorationView.kind];
	}
	
	return self;
}


- (void)prepareLayout {
	[super prepareLayout];
	
	// Perform any initial calculations needed for layout later
}


- (CGSize)collectionViewContentSize {
	CGSize size = [super collectionViewContentSize];
	
	// Determine overall size of entire content area based on initial calculation
	
	return size;
}


- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
	
	NSMutableArray* attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
	
	// Determine attributes for cells, supplementary views, and decoration views in rectangle
//	[UICollectionViewLayoutAttributes
//	 layoutAttributesForDecorationViewOfKind:PhotoCollectionDecorationView.kind
//	 withIndexPath:key]
	
	return attributes;
}


@end
