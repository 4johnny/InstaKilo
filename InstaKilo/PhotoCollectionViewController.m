//
//  PhotoCollectionViewController.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "PhotoCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoCollectionSectionReusableView.h"
#import "PhotoCollectionViewFlowLayout.h"
#import "PhotoCollectionDecorationView.h"

//#import "Model.h"
#import "Section.h"
#import "Photo.h"


#
# pragma mark - Constants
#


#define IMAGE_SCALING_FACTOR 0.15


#
# pragma mark - Implementation
#


@implementation PhotoCollectionViewController


static NSString* const photoCellReuseIdentifier = @"photoCollectionViewCell";
static NSString* const photoSectionHeaderReuseIdentifier = @"photoCollectionSectionReusableView";


#
# pragma mark UIViewController
#


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	
	// Uncomment the following line to preserve selection between presentations
	// self.clearsSelectionOnViewWillAppear = NO;
	
	// Register cell classes
	// [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

	PhotoCollectionViewFlowLayout* flowLayout = (PhotoCollectionViewFlowLayout*)self.collectionViewLayout;
	[flowLayout registerClass:PhotoCollectionDecorationView.class forDecorationViewOfKind:PhotoCollectionDecorationView.kind];

	// NOTE: For finer-grain control, these can be set in delegate implementations below.
	//	flowLayout.itemSize = CGSizeMake(120, 100);
	//	flowLayout.minimumLineSpacing = 50;
	//	flowLayout.minimumInteritemSpacing = 50;
	//	flowLayout.headerReferenceSize = CGSizeMake(150, 50); // Assertion failure if footer does not exist
	//	flowLayout.footerReferenceSize = CGSizeMake(150, 50); // Assertion failure if footer does not exist
	
	self.collectionView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"floral_motif_2"]];
	//  self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"floral_motif_2"]];
	
	self.sectionType = SECTION_LOCATION;
}


- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	//	[PhotoCollectionViewController logSubviewTree:self.view];
	
}


- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
	[super prepareForSegue:segue sender:sender];
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
	
}


#
# pragma mark <UICollectionViewDataSource>
#


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
	
	return ((NSArray*)(self.model.data[self.sectionType])).count;
}


- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
	
	return ((Section*)self.model.data[self.sectionType][section]).items.count;
}


- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath {

	// Configure the cell

	PhotoCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoCellReuseIdentifier forIndexPath:indexPath];
	
	Section* section = (Section*)(self.model.data[self.sectionType][indexPath.section]);
	Photo* photo = (Photo*)section.items[indexPath.row];
	cell.photoImageView.image = [UIImage imageNamed:photo.imageName];
	
	return cell;
}


- (UICollectionReusableView*)collectionView:(UICollectionView*)collectionView viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)indexPath {
	
	// Configure the supplementary element: view or decoration
	
	if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
		
		PhotoCollectionSectionReusableView* reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:photoSectionHeaderReuseIdentifier forIndexPath:indexPath];
		
		Section* section = (Section*)self.model.data[self.sectionType][indexPath.section];
		reusableView.subjectLabel.text = section.name;
		reusableView.subjectLabel.transform = CGAffineTransformMakeRotation(-M_PI_2);
		
		return reusableView;
	}

	if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
		
		// NOTE: If a footer is added, then dequeue the view here.

		return nil;
	}

	return nil; // NOTE: We should never get here!
}


#
# pragma mark <UICollectionViewDelegate>
#


- (BOOL)collectionView:(UICollectionView*)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath*)indexPath {
 
	// Determine if the specified item should be highlighted during tracking
	
	return YES; // Default YES
}


- (BOOL)collectionView:(UICollectionView*)collectionView shouldSelectItemAtIndexPath:(NSIndexPath*)indexPath {
	
	// Determine if the specified item should be selected
	
	return YES; // Default YES
}


- (BOOL)collectionView:(UICollectionView*)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath*)indexPath {
	
	// Determine if an action menu should be displayed for the specified item, and react to actions performed on the item
	
	return YES; // Default NO
}


- (BOOL)collectionView:(UICollectionView*)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath*)indexPath withSender:(id)sender {
	
	// Determine if an action menu should be displayed for the specified item, and react to actions performed on the item
	
	return YES; // Default NO
}


- (void)collectionView:(UICollectionView*)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath*)indexPath withSender:(id)sender {
 
 // Determine if an action menu should be displayed for the specified item, and react to actions performed on the item
}


#
# pragma mark <UICollectionViewDelegateFlowLayout>
#

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath {

	Section* section = (Section*)(self.model.data[self.sectionType][indexPath.section]);
	Photo* photo = (Photo*)section.items[indexPath.row];
	UIImage* image = [UIImage imageNamed:photo.imageName];
	
	return CGSizeMake(image.size.width * IMAGE_SCALING_FACTOR, image.size.height * IMAGE_SCALING_FACTOR);

	//	switch (indexPath.section) {
	//
	//		case 0: {
	//			int width = 100 + arc4random_uniform(200);
	//			int height = width;
	//			return CGSizeMake(width, height);
	//		}
	//
	//		case 1: {
	//			int width = 200;
	//			int height = 200;
	//			return CGSizeMake(width, height);
	//		}
	//	}
 
//	return ((UICollectionViewFlowLayout*)collectionViewLayout).itemSize;
}


-(UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
	
//	switch (section) {
//			
//		case 0:
//			return UIEdgeInsetsMake(10, 10, 10, 10);
//			
//		case 1:
//			return UIEdgeInsetsMake(50, 50, 50, 50);
//	}
	
	return ((UICollectionViewFlowLayout*)collectionViewLayout).sectionInset;
}


- (CGFloat)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
	
//	switch (section) {
//			
//		case 0:
//			return 50;
//			
//		case 1:
//			return 0;
//	}
	
	return ((UICollectionViewFlowLayout*)collectionViewLayout).minimumLineSpacing;
}


- (CGFloat)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
	
//	switch (section) {
//			
//		case 0:
//			return 100;
//			
//		case 1:
//			return 0;
//	}
	
	return ((UICollectionViewFlowLayout*)collectionViewLayout).minimumInteritemSpacing;
}


- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
 
//	switch (section) {
//			
//		case 0:
//			return CGSizeMake(150, 150);
//			
//		case 1:
//			return CGSizeMake(70, 70);
//	}
	
	return ((UICollectionViewFlowLayout*)collectionViewLayout).headerReferenceSize;
}


- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
 
//	switch (section) {
//			
//		case 0:
//			return CGSizeMake(150, 150);
//			
//		case 1:
//			return CGSizeMake(70, 70);
//	}
	
	return ((UICollectionViewFlowLayout*)collectionViewLayout).footerReferenceSize;
}


#
# pragma mark - Helpers
#


+ (void)logSubviewTree:(UIView*)view {
	
	MDLog(@"%@: frame: (%.1f, %.1f, %.1f, %.1f), superview:%@", view.class, view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height, view.superview.class);
	
	for (UIView* subview in view.subviews) {
		
		[self logSubviewTree:subview];
	}
}


@end
