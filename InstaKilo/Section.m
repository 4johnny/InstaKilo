//
//  Section.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "Section.h"


@implementation Section


- (instancetype)initWithItems:(NSArray*)items andName:(NSString*)name {
	
	self = [super init];
	if (self) {
		
		_items = items;
		_name = name;
	}
	
	return self;
}


- (instancetype)init {
	return [self initWithItems:nil andName:nil];
}


+ (Section*)sectionWithItems:(NSArray*)items andName:(NSString*)name {
	
	return [[Section alloc] initWithItems:items andName:name];
}


@end
