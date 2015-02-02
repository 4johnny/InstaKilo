//
//  Model.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "PhotosModel.h"


#
# pragma mark - Implementation
#


@implementation PhotosModel


#
# pragma mark Initializers
#


- (instancetype)initWithData:(NSMutableArray*)photos andSectionType:(SectionType)sectionType {
	
	self = [super init];
	if (self) {
		
		_sectionType = sectionType;
		_sections = [PhotosModel makePhotoSections:photos withSectionType:sectionType];
	}
	
	return self;
}


- (instancetype)init {
	
	return [self initWithData:nil andSectionType:INIT_SECTION_TYPE];
}


#
# pragma mark Accessors
#


-(void)setSectionType:(SectionType)sectionType {

	_sectionType = sectionType;
	
	NSMutableArray* photos = [NSMutableArray array];
	for (PhotosSection* section in _sections) {
		[photos addObjectsFromArray:section.photos];
	}
	_sections = [PhotosModel makePhotoSections:photos withSectionType:sectionType];
}


#
# pragma mark - Helpers
#


+ (PhotosModel*)modelWithPhotos:(NSMutableArray*)photos andSectionType:(SectionType)sectionType {
	
	return [[PhotosModel alloc] initWithData:photos andSectionType:sectionType];
}


+ (NSArray*)makePhotoSections:(NSMutableArray*)photos withSectionType:(SectionType)sectionType {
	
	NSMutableArray* sections = [NSMutableArray array];
	NSMutableArray* sectionPhotos;
	
	switch (sectionType) {
			
		case SectionType_Subject:
			
			sectionPhotos = [NSMutableArray arrayWithArray:[photos filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"subject == %@", SUBJECT_WORK]]];
			[sections addObject:[PhotosSection sectionWithPhotos:sectionPhotos andName:SUBJECT_WORK]];
			
			sectionPhotos = [NSMutableArray arrayWithArray:[photos filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"subject == %@", SUBJECT_PLAY]]];
			[sections addObject:[PhotosSection sectionWithPhotos:sectionPhotos andName:SUBJECT_PLAY]];
			
			break;
			
		case SectionType_Location:

			sectionPhotos = [NSMutableArray arrayWithArray:[photos filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"location == %@", LOCATION_KITCHEN]]];
			[sections addObject:[PhotosSection sectionWithPhotos:sectionPhotos andName:LOCATION_KITCHEN]];
			
			sectionPhotos = [NSMutableArray arrayWithArray:[photos filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"location == %@", LOCATION_DESK]]];
			[sections addObject:[PhotosSection sectionWithPhotos:sectionPhotos andName:LOCATION_DESK]];
			
			sectionPhotos = [NSMutableArray arrayWithArray:[photos filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"location == %@", LOCATION_DOORS]]];
			[sections addObject:[PhotosSection sectionWithPhotos:sectionPhotos andName:LOCATION_DOORS]];
			
			break;
	}

	return sections;
}


@end
