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

#import "Model.h"
#import "Section.h"
#import "Photo.h"


#
# pragma mark - Interface
#


@interface PhotoCollectionViewController ()

@end


#
# pragma mark - Implementation
#


@implementation PhotoCollectionViewController


static NSString * const photoCellReuseIdentifier = @"photoCollectionViewCell";
static NSString * const photoReusableReuseIdentifier = @"photoCollectionReusableView";


#
# pragma mark UIViewController
#


- (void)viewDidLoad {
	[super viewDidLoad];
	
	// Uncomment the following line to preserve selection between presentations
	// self.clearsSelectionOnViewWillAppear = NO;
	
	// Register cell classes
	// [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
	
	// Do any additional setup after loading the view.
	
	UICollectionViewFlowLayout* flowLayout = (UICollectionViewFlowLayout*)self.collectionViewLayout;
	flowLayout.headerReferenceSize = CGSizeMake(75, 25);
}


/*
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
	
	return self.model.data.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	
	return (0 <= section && section < self.model.data.count) ?
	((Section*)self.model.data[section]).items.count : 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
	PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoCellReuseIdentifier forIndexPath:indexPath];
	
	// Configure the cell
	if (0 <= indexPath.section && indexPath.section < self.model.data.count) {

		Section* section = (Section*)(self.model.data[indexPath.section]);
		Photo* photo = (Photo*)section.items[indexPath.row];
		cell.photoImageView.image = [UIImage imageNamed:photo.imageName];
	}
	
	return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	
	PhotoCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:photoReusableReuseIdentifier forIndexPath:indexPath];
	
	// Configure the supplementary view
	if (0 <= indexPath.section && indexPath.section < self.model.data.count) {
		
		Section* section = (Section*)self.model.data[indexPath.section];
		reusableView.subjectLabel.text = section.name;
		reusableView.subjectLabel.transform = CGAffineTransformMakeRotation(-M_PI_2);
	}
	
	return reusableView;
}


/*
#
# pragma mark - UICollectionViewDelegateFlowLayout
#


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {

	return CGSizeMake(75, 25);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {

	return CGSizeZero;
}
*/


/*
#
# pragma mark <UICollectionViewDelegate>
#
*/

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
