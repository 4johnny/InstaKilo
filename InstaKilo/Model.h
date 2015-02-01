//
//  Model.h
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


#
# pragma mark - Constants
#


#define SECTION_SUBJECT		@"sectionBySubject"
#define SECTION_LOCATION	@"sectionByLocation"


#
# pragma mark - Interface
#


@interface Model : NSObject

@property (nonatomic) NSDictionary* data;

+ (Model*)modelWithData:(NSDictionary*)data;

@end
