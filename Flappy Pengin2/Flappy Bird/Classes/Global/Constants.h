

//#ifndef MrDentist_Constants_h
//#define MrDentist_Constants_h
#import <RevMobAds/RevMobAds.h>
#import "Chartboost.h"
#import "ALAdDisplayDelegate.h"
#import "ALInterstitialAd.h"

#define OBSTACLE_COUNT 3

#define RATE_MESSAGE                @"If you like Flappy Penguin, please rate it with 5 stars! Thanks!"
#define RATE_TITLE                  @"Flappy Penguin"

#define EMAIL_SUBJECT               @"Flappy Penguin"
#define EMAIL_BODY                  @"Check out the AMAZING Flappy Penguin! - https://itunes.apple.com/us/app/flappy-penguin-free/id814321493?ls=1&mt=8"

#define GAME_FBTEXT                 @"Check out the AMAZING Flappy Penguin! - https://itunes.apple.com/us/app/flappy-penguin-free/id814321493?ls=1&mt=8"
#define GAME_TWITTERTEXT            @"Check out the AMAZING Flappy Penguin! - https://itunes.apple.com/us/app/flappy-penguin-free/id814321493?ls=1&mt=8"

#define IAP_Q_LIVES                 @"Continue game with 3 Extra lives?"

#define DEBUG_MODE                  NO
#define ENABLE_LIVES                YES
#define LIVES_COUNT                 3


#ifdef FREE_VERSION         // Configure FREE Version

#define RATE_ID                     @"814321493"

#define LEADERBOARD_ID              @"grp.com.Sentio.FlappyPenguin.Leaderboard"

#define REVMOB_APP_ID               @"52f09fb853adbb7c65000015"
#define REVMOB_BANNER_ENABLE        YES
#define CHARTBOOST_APP_ID           @"52f09fe59ddc3557366f43d1"
#define CHARTBOOST_APP_SIGNATURE    @"f7376e9e04c72276928d7c3fa1d81ba38dc9328b"
#define FLURRY_ID                   @"KJDH7TKYJNP98CGHM6HK"
#define ASKINGPOINT_ID               @"TgC1APACUgOOmdJb3yr2O3Z1Qu6rZNHgptvjLJDs2ec="

#define IAP_LIVES                   @"com.Sentio.FlappyPenguin.ExtraLives"

#else                       // Configure PRO version

#define RATE_ID                     @"814321666"

#define LEADERBOARD_ID              @"grp.com.Sentio.FlappyPenguin.Leaderboard"

#define REVMOB_APP_ID               @"52f09fd353adbb7c6500001f"
#define REVMOB_BANNER_ENABLE        NO
#define CHARTBOOST_APP_ID           @"52f0a02e2d42da42e2261833"
#define CHARTBOOST_APP_SIGNATURE    @"3857ebed0b5f0d368f4bc7705a36775d987438a7"
#define FLURRY_ID                   @"D28KF5ZYPJFS5F5B7WC4"
#define ASKINGPOINT_ID               @"iAC1APACUgNhH8vsWxLW4sLiX0allyUFTS63GUY8UUI="

#define IAP_LIVES                   @"com.Sentio.FlappyPenguinPro.ExtraLives"

#endif
