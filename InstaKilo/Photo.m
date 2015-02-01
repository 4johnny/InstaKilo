//
//  Photo.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "Photo.h"


@implementation Photo


- (instancetype)initWithImageName:(NSString*)imageName andSubject:(NSString*)subject andLocation:(NSString*)location {
	
	self = [super init];
	if (self) {
		
		_imageName = imageName;
		_subject = subject;
		_location = location;
	}
	
	return self;
}


- (instancetype)init {
	
	return [self initWithImageName:nil andSubject:nil andLocation:nil];
}


+ (Photo*)photoWithImageName:(NSString*)imageName andSubject:(NSString*)subject andLocation:(NSString*)location {

	return [[Photo alloc] initWithImageName:imageName andSubject:subject andLocation:location];
}


@end
