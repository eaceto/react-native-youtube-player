#import "YoutubePlayerManager.h"

@implementation YoutubePlayerManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(play:(NSString *)videoId options:(NSDictionary *)options) {

    NSLog(@"YoutubePlayerManager [call] playVideoWithID - videoId %@ - options %@", videoId, options);

    /*
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        while (root.presentedViewController != nil) {
            root = root.presentedViewController;
        }
        
        YoutubePlayerViewController* v = [YoutubePlayerViewController new];
        [v setVideoId:self.videoId];
        
        [root presentViewController:v animated:YES completion:nil];
    });
    */
}

@end
