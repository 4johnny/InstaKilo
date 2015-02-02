//
//  PhotoCollectionViewFlowLayout.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "PhotoCollectionViewFlowLayout.h"
#import "PhotoCollectionDecorationView.h"


#
# pragma mark - Interface
#


@interface PhotoCollectionViewFlowLayout()

@property (nonatomic) NSMutableArray* deleteItemPaths;

@end


#
# pragma mark - Implementation
#


@implementation PhotoCollectionViewFlowLayout

// NOTE: If using self.collectionView, only rely on data model


#
# pragma mark UICollectionViewLayout
#

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
	
	NSMutableArray* allAttributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
	
	// Determine attributes for cells, supplementary views, and decoration views in rectangle

	// Make sure everything is in right Z order
	for (UICollectionViewLayoutAttributes* attributes in allAttributes) {
		
		attributes.zIndex = 1;
	}
	
	// Decorator
	[allAttributes addObject:[self makeDecorationAttributes:nil]];
	
	return allAttributes;
}


- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath*)indexPath {

	UICollectionViewLayoutAttributes* attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
	
	// Determine attributes for cells at index path

	return attributes;
}


- (UICollectionViewLayoutAttributes*)layoutAttributesForSupplementaryViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath*)indexPath {

	UICollectionViewLayoutAttributes* attributes = [super layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:indexPath];
	
	// Determine attributes for supplementary views at index path
	
	return attributes;
}


- (UICollectionViewLayoutAttributes*)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath*)indexPath {
	
	UICollectionViewLayoutAttributes* decorationAttributes = [super layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:indexPath];

	// Determine attributes for decoration views at index path
	
	return [self makeDecorationAttributes:decorationAttributes];
}


- (void)prepareForCollectionViewUpdates:(NSArray*)updateItems {
	
	[super prepareForCollectionViewUpdates:updateItems];
	
	if (updateItems.count <= 0) return;
	
	self.deleteItemPaths = [NSMutableArray array];
	
	for (UICollectionViewUpdateItem* item in updateItems) {
		
		if (item.updateAction != UICollectionUpdateActionDelete) continue;
		[self.deleteItemPaths addObject:item.indexPathBeforeUpdate];
	}
}


- (UICollectionViewLayoutAttributes*)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath*)itemIndexPath {

	UICollectionViewLayoutAttributes* attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];

	//	attributes.alpha = 0.0;
	//
	//	CGSize size = self.collectionView.frame.size;
	//	attributes.center = CGPointMake(size.width / 2.0, size.height / 2.0);
	
	return attributes;
}


- (UICollectionViewLayoutAttributes*)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath*)itemIndexPath {

	UICollectionViewLayoutAttributes* attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
	
	if ([self.deleteItemPaths containsObject:itemIndexPath]) {
		
		CGPoint origin = self.collectionView.bounds.origin;
		CGSize size = self.collectionView.bounds.size;
		attributes.center = CGPointMake(attributes.center.x, origin.y + size.height);
		
		//	attributes.size = CGSizeMake(attributes.size.width * .5, attributes.size.height * .5);
		//	attributes.alpha = 0.5;
	}

	return attributes;
}


- (void)finalizeCollectionViewUpdates {
	[super finalizeCollectionViewUpdates];

	self.deleteItemPaths = nil;
}


#
# pragma mark Helpers
#


- (UICollectionViewLayoutAttributes*)makeDecorationAttributes:(UICollectionViewLayoutAttributes*)decorationAttributes {
	
	if (!decorationAttributes) {
		decorationAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:PhotoCollectionDecorationView.kind withIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
	}
	
	decorationAttributes.frame = CGRectMake(0.0, 0.0, self.collectionViewContentSize.width, self.collectionViewContentSize.height);
	decorationAttributes.zIndex = 0;
	
	return decorationAttributes;
}


@end
