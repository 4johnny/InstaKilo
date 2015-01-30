//
//  PhotoCollectionViewController.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "PhotoCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoCollectionReusableView.h"
#import "Photo.h"


#define SUBJECT_SECTION_COUNT		2
#define SUBJECT_SECTION_INDEX_WORK	0
#define SUBJECT_SECTION_INDEX_PLAY	1


@interface PhotoCollectionViewController ()

@end


@implementation PhotoCollectionViewController


static NSString * const photoCellReuseIdentifier = @"photoCollectionViewCell";
static NSString * const photoReusableReuseIdentifier = @"photoCollectionReusableView";


- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Uncomment the following line to preserve selection between presentations
	// self.clearsSelectionOnViewWillAppear = NO;
	
	// Register cell classes
	//    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
	
	// Do any additional setup after loading the view.
//	UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
//	flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//	flowLayout.headerReferenceSize = CGSizeMake(30, 20);
//	flowLayout.footerReferenceSize = CGSizeZero;
//	UICollectionView* collectionView = (UICollectionView*)self.view;
//	collectionView.collectionViewLayout = flowLayout;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


#
# pragma mark <UICollectionViewDataSource>
#


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	
	return SUBJECT_SECTION_COUNT;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	switch (section) {
			
		case SUBJECT_SECTION_INDEX_WORK:
			return self.photosWork.count;
			
		case SUBJECT_SECTION_INDEX_PLAY:
			return self.photosPlay.count;
	}
	
	return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoCellReuseIdentifier forIndexPath:indexPath];
	
	// Configure the cell
	switch (indexPath.section) {
			
		case SUBJECT_SECTION_INDEX_WORK:
			cell.photoImageView.image = [UIImage imageNamed:((Photo*)self.photosWork[indexPath.row]).imageName];
			break;
			
		case SUBJECT_SECTION_INDEX_PLAY:
			cell.photoImageView.image = [UIImage imageNamed:((Photo*)self.photosPlay[indexPath.row]).imageName];
			break;
	}
	
	return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	
	PhotoCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:photoReusableReuseIdentifier forIndexPath:indexPath];

	// Configure the supplementary view
	switch (indexPath.section) {
			
		case SUBJECT_SECTION_INDEX_WORK:
			reusableView.subjectLabel.text = ((Photo*)self.photosWork[indexPath.row]).subject;
			break;
			
		case SUBJECT_SECTION_INDEX_PLAY:
			reusableView.subjectLabel.text = ((Photo*)self.photosPlay[indexPath.row]).subject;
			break;
	}
	
	reusableView.subjectLabel.transform = CGAffineTransformMakeRotation(-M_PI_2);
	
	return reusableView;
}


#
# pragma mark – UICollectionViewDelegateFlowLayout
#


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
	
	return CGSizeMake(75, 25);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
	
	return CGSizeZero;
}


#
# pragma mark <UICollectionViewDelegate>
#


/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end
