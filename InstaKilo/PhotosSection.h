//
//  Section.h
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PhotosSection : NSObject

@property (nonatomic) NSMutableArray* photos;
@property (nonatomic) NSString* name;

+ (PhotosSection*)sectionWithPhotos:(NSMutableArray*)photos andName:(NSString*)name;

@end
