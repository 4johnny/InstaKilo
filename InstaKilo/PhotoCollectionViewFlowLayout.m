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
# pragma mark - Constants
#


#define CENTER_OFFSET_BOUND		20
#define ROTATION_ANGLE_BOUND	5 // degrees


#
# pragma mark - Macros
#


#define RADIANS(degrees) ((degrees * M_PI) / 180.0)


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

	for (UICollectionViewLayoutAttributes* attributes in allAttributes) {
		
		// All elements initially at Z level 1
		attributes.zIndex = 1;
		
		// Cells
		[PhotoCollectionViewFlowLayout tweakCellAttributes:attributes];
	}
	
	// Decorator
	[allAttributes addObject:[self makeDecorationAttributes:nil]];
	
	return allAttributes;
}


- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath*)indexPath {

	UICollectionViewLayoutAttributes* attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
	
	// Determine attributes for cells at index path
	[PhotoCollectionViewFlowLayout tweakCellAttributes:attributes];

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


+ (void)tweakCellAttributes:(UICollectionViewLayoutAttributes*)cellAttributes {

	if (cellAttributes.representedElementCategory != UICollectionElementCategoryCell) return;

	// Offset center by bounded random amount
	double centerXOffset = arc4random_uniform(CENTER_OFFSET_BOUND + 1) - (CENTER_OFFSET_BOUND / 2.0);
	double centerYOffset = arc4random_uniform(CENTER_OFFSET_BOUND + 1) - (CENTER_OFFSET_BOUND / 2.0);
	cellAttributes.center = CGPointMake(cellAttributes.center.x + centerXOffset,
									cellAttributes.center.y + centerYOffset);
	
	// Rotate by bounded random angle
	double rotationAngle = arc4random_uniform(ROTATION_ANGLE_BOUND + 1) - (ROTATION_ANGLE_BOUND / 2.0);
	cellAttributes.transform = CGAffineTransformMakeRotation(RADIANS(rotationAngle));
}


- (UICollectionViewLayoutAttributes*)makeDecorationAttributes:(UICollectionViewLayoutAttributes*)decorationAttributes {
	
	if (!decorationAttributes) {
		decorationAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:PhotoCollectionDecorationView.kind withIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
	}
	
	decorationAttributes.frame = CGRectMake(0.0, 0.0, self.collectionViewContentSize.width, self.collectionViewContentSize.height);
	decorationAttributes.zIndex = 0;
	
	return decorationAttributes;
}


@end
