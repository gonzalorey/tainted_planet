//
//  GameManager.h
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "BaseScene.h"
#import "BaseWorld.h"

@interface GameManager : NSObject {
        SceneTypes currentScene;
}

+(GameManager*)sharedGameManager;
-(void)runSceneWithID:(SceneTypes)sceneID;
-(BaseWorld*)getRunningWorld;
-(BaseScene*)getRunningScene;

@end
