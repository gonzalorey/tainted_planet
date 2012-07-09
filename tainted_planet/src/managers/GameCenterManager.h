//
//  GameCenterManager.h
//  tainted_planet
//
//  Created by Gonzalo Rey on 7/9/12.
//  Copyright (c) 2012 Big King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@interface GameCenterManager : NSObject {
    BOOL gameCenterAvailable;
    BOOL userAuthenticated;
}

+(GameCenterManager*)getInstance;
-(void)authenticateUser;
@end
