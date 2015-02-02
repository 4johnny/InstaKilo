//
//  AppDelegate.m
//  InstaKilo
//
//  Created by Johnny on 2015-01-29.
//  Copyright (c) 2015 Empath Solutions. All rights reserved.
//

#import "AppDelegate.h"
#import "PhotoCollectionViewController.h"
#import "PhotosModel.h"
#import "Photo.h"


#
# pragma mark - Constants
#


#
# pragma mark - Implementation
#


@implementation AppDelegate


#
# pragma mark <UIApplicationDelegate>
#


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	
	// Load data model, and inject into photo collection view controller
	
	PhotosModel* photosModel = [AppDelegate loadModel];
	
	UINavigationController* navigationViewcontroller = (UINavigationController*)self.window.rootViewController;
	PhotoCollectionViewController* photoCollectionViewcontroller = (PhotoCollectionViewController*)navigationViewcontroller.viewControllers.firstObject;
	
	photoCollectionViewcontroller.photosModel = photosModel;
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#
# pragma mark Helpers
#


+ (PhotosModel*)loadModel {
	
	//
	// Data
	//
	
	NSArray* photos =
    @[
	  [Photo photoWithImageName:@"backpack"
					 andSubject:SUBJECT_WORK
					andLocation:LOCATION_DESK],
	  
	  [Photo photoWithImageName:@"growlab_sign"
					 andSubject:SUBJECT_WORK
					andLocation:LOCATION_DOORS],
	  
	  [Photo photoWithImageName:@"laptop_keyboard"
					 andSubject:SUBJECT_WORK
					andLocation:LOCATION_DESK],
	  
	  [Photo photoWithImageName:@"lighthouse_labs_sign"
					 andSubject:SUBJECT_WORK
					andLocation:LOCATION_DOORS],
	  
	  [Photo photoWithImageName:@"redbull_fridge"
					 andSubject:SUBJECT_WORK
					andLocation:LOCATION_KITCHEN],
	  
	  [Photo photoWithImageName:@"atari_arcade_angle"
					 andSubject:SUBJECT_PLAY
					andLocation:LOCATION_KITCHEN],
	  
	  [Photo photoWithImageName:@"atari_arcade_straight"
					 andSubject:SUBJECT_PLAY
					andLocation:LOCATION_KITCHEN],
	  
	  [Photo photoWithImageName:@"chessboard"
					 andSubject:SUBJECT_PLAY
					andLocation:LOCATION_KITCHEN],
	  
	  [Photo photoWithImageName:@"foosball_table"
					 andSubject:SUBJECT_PLAY
					andLocation:LOCATION_KITCHEN],
	  
	  [Photo photoWithImageName:@"lighthouse_painting"
					 andSubject:SUBJECT_PLAY
					andLocation:LOCATION_DESK]
	  ];

	return [PhotosModel modelWithPhotos:[NSMutableArray arrayWithArray:photos]
						 andSectionType:INIT_SECTION_TYPE];
}


@end
