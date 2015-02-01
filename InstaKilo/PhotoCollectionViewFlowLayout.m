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

// NOTE: If using self.collectionView, only rely on data model


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
	
	// Determine overall size of entire content area based on initial calculations
	//	size.width *= 1.25;
	//	size.height *= 1.25;
	
	return size;
}


- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
	
	NSMutableArray* attributesArray = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
	
	// Determine attributes for cells, supplementary views, and decoration views in rectangle
	
	return attributesArray;
}


- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath*)indexPath {

	UICollectionViewLayoutAttributes* attributes = [[super layoutAttributesForItemAtIndexPath:indexPath] mutableCopy];
	

	return attributes;
}


- (UICollectionViewLayoutAttributes*)layoutAttributesForSupplementaryViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath*)indexPath {

	UICollectionViewLayoutAttributes* attributes = [[super layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:indexPath] mutableCopy];
	
	
	return attributes;
}


- (UICollectionViewLayoutAttributes*)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath*)indexPath {
	
	UICollectionViewLayoutAttributes* attributes = [[super layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:indexPath] mutableCopy];
	
	
	return attributes;
}


@end
