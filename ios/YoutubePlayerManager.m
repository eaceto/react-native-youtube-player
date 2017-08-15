#import "YoutubePlayerManager.h"
#import <React/RCTConvert.h>
#import <AVFoundation/AVFoundation.h>

@import MobileCoreServices;

@interface YoutubePlayerManager ()

@property (nonatomic, retain) NSMutableDictionary *options;
@property (nonatomic, strong) NSString *videoId;

@end

@implementation YoutubePlayerManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(playVideoWithID:(NSString*)videoId  options:(NSDictionary *)options)
{
    NSLog(@"YoutubePlayerManager [call] playVideoWithID - videoId %@ - options %@", videoId, options);
    
    self.videoId = videoId;
    self.options = options;

    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        while (root.presentedViewController != nil) {
            root = root.presentedViewController;
        }
        
        /*
        [root presentViewController:self.alertController animated:YES completion:nil];
        */
    });
}

@end
