//
//  Model.h
//  InstaKilo
//
//  Created by Johnny on 2015-01-30.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic) NSArray* data;

+ (Model*)modelWithData:(NSArray*)data;

@end
