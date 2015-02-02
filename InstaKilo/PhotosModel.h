//
//  Model.h
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotosSection.h"


#
# pragma mark - Types
#


typedef NS_ENUM(long, SectionType) {

	SectionType_Subject = 0,
	SectionType_Location = 1
};


#
# pragma mark - Constants
#


#define INIT_SECTION_TYPE	SectionType_Subject

#define SUBJECT_WORK		@"Work"
#define SUBJECT_PLAY		@"Play"

#define LOCATION_KITCHEN	@"Kitchen"
#define LOCATION_DESK		@"Desk"
#define LOCATION_DOORS		@"Doors"


#
# pragma mark - Interface
#


@interface PhotosModel : NSObject

@property (nonatomic) SectionType sectionType;
@property (nonatomic) NSArray* sections;

+ (PhotosModel*)modelWithPhotos:(NSMutableArray*)photos andSectionType:(SectionType)sectionType;

@end
