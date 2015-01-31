//
//  Model.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "Model.h"


@implementation Model

- (instancetype)initWithData:(NSArray*)data {
	
	self = [super init];
	if (self) {
		
		_data = data;
	}
	
	return self;
}


- (instancetype)init {
	
	return [self initWithData:nil];
}


+ (Model*)modelWithData:(NSArray*)data {
	
	return [[Model alloc] initWithData:data];
}


@end
