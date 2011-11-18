//
//  GameManager.m
//  tainted_planet
//
//  Created by Gonzalo Rey on 10/2/11.
//  Copyright 2011 OLX. All rights reserved.
//

#import "GameManager.h"
#import "MainMenuScene.h"
#import "Lvl1World.h"


@implementation GameManager

// singleton instance
static GameManager* _sharedGameManager = nil;

+(GameManager*) sharedGameManager
{
    @synchronized([GameManager class])
    {
        if(!_sharedGameManager)
            [[self alloc] init];
        return _sharedGameManager;
    }
    return nil;
}

+(id) alloc
{
    @synchronized ([GameManager class])
    {
        NSAssert(_sharedGameManager == nil, 
                 @"Attempted to allocate a second instance of the Game Manager singleton");
        _sharedGameManager = [super alloc];
        return _sharedGameManager;
    }
    return nil;
}

-(id) init
{
    self = [super init];
    if (self) {
        // Game Manager initialized
        CCLOG(@"Game Manager Singleton, init");
        currentScene = kNoSceneUninitialized;
    }
    
    return self;
}

-(void) runSceneWithID:(SceneTypes)sceneID 
{
    SceneTypes oldScene = currentScene;
    currentScene = sceneID;
    
    id sceneToRun = nil;
    switch (sceneID) {
        case kMainMenuScene:
            sceneToRun = [MainMenuScene node];
            break;
        case kGameLevel1:
            sceneToRun = [Lvl1World node];
            break;
        default:
            CCLOG(@"Unknown ID, cannot switch scenes");
            return;
        break;
    }
    if (sceneToRun == nil) {
        // Revert back, since no new scene was found
        currentScene = oldScene;
        return;
    }
    
    // Menu Scenes have a value of < 100
    if (sceneID < 100) {
        if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) { CGSize screenSize =
            [CCDirector sharedDirector].winSizeInPixels;
            if (screenSize.width == 960.0f) {
                // iPhone 4 Retina
                [sceneToRun setScaleX:0.9375f];
                [sceneToRun setScaleY:0.8333f];
                CCLOG(@"GM:Scaling for iPhone 4 (retina)");
            } else {
                [sceneToRun setScaleX:0.4688f];
                [sceneToRun setScaleY:0.4166f];
                CCLOG(@"GM:Scaling for iPhone 3G(non-retina)");
            }
        }
    }
    

    if ([[CCDirector sharedDirector] runningScene] == nil) {
        [[CCDirector sharedDirector] runWithScene:sceneToRun];
    } else {
        [[CCDirector sharedDirector] replaceScene:sceneToRun];
    }

}

-(BaseWorld*)getRunningWorld
{
    CCScene* scene = [self getRunningScene];
    if([scene isKindOfClass:[BaseWorld class]])
        return (BaseWorld*) scene;
    else
        return nil;
}

-(BaseScene*)getRunningScene
{
    return (BaseScene*)[[CCDirector sharedDirector] runningScene];
}
@end
