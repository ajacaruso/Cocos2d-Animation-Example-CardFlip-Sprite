//FlipCardExample

//Copyright 2013 Adam Jacaruso

//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at

//http://www.apache.org/licenses/LICENSE-2.0

//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

#import "HelloWorldLayer.h"
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

@implementation HelloWorldLayer
@synthesize cardSprite;

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
	
	if( (self=[super init]) ) {
        CGSize windowSize = [[CCDirector sharedDirector] winSize];
        
        //Creating a new SpriteFlipCard and adding it
        cardSprite = [[SpriteFlipCard alloc] initSpriteFlipCardWithImageOne:@"SideOne@2x.png" andImageTwo:@"SideTwo@2x.png"];
        cardSprite.position =  ccp(windowSize.width /2 , windowSize.height/2 );
        [self addChild:cardSprite];
        
        //Creating a timer to show the flip.
        [self schedule:@selector(exampleFlips:) interval:3.0];
        
       
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

//Calling the cardSprites flipSprite functionality.
-(void) exampleFlips:(ccTime)delta
{
    [cardSprite flipSpriteHorizontal:1.0f];
    //[cardSprite flipSpriteVertical:1.0f];
}


#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
