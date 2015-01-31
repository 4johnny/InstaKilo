//
//  Photo.h
//  InstaKilo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Photo : NSObject

@property (nonatomic) NSString* imageName;
@property (nonatomic) NSString* subject;

+ (Photo*)photoWithImageName:(NSString*)imageName andSubject:(NSString*)subject;

@end
