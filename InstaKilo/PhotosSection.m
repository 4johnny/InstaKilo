//
//  Section.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "PhotosSection.h"


@implementation PhotosSection


- (instancetype)initWithPhotos:(NSMutableArray*)photos andName:(NSString*)name {
	
	self = [super init];
	if (self) {
		
		_photos = photos;
		_name = name;
	}
	
	return self;
}


- (instancetype)init {
	return [self initWithPhotos:nil andName:nil];
}


+ (PhotosSection*)sectionWithPhotos:(NSMutableArray*)photos andName:(NSString*)name {
	
	return [[PhotosSection alloc] initWithPhotos:photos andName:name];
}


@end
