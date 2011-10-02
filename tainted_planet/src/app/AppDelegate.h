//
//  AppDelegate.h
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/2/11.
//  Copyright OLX 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
