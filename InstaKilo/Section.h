//
//  Section.h
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Section : NSObject

@property (nonatomic) NSMutableArray* items;
@property (nonatomic) NSString* name;

+ (Section*)sectionWithItems:(NSMutableArray*)items andName:(NSString*)name;

@end
