#import "YoutubePlayerManager.h"
#import "YoutubePlayerViewController.h"
@implementation YoutubePlayerManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(play:(NSString *)videoId options:(NSDictionary *)opt) {

    NSMutableDictionary* options = [NSMutableDictionary new];
    [options setObject:@1 forKey:@"autoplay"];
    [options setObject:@2 forKey:@"controls"];
    [options setObject:@1 forKey:@"enablejsapi"];
    [options setObject:@0 forKey:@"playsinline"];
    [options setObject:@1 forKey:@"showinfo"];
    
    if (opt != nil) {
        [options addEntriesFromDictionary:opt];
    }
    
    NSLog(@"YoutubePlayerManager [call] playVideoWithID - videoId %@ - options %@", videoId, options);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        while (root.presentedViewController != nil) {
            root = root.presentedViewController;
        }
        
        NSBundle *bundle = [NSBundle mainBundle];
        
        YoutubePlayerViewController* v = [[YoutubePlayerViewController alloc] initWithNibName:@"YoutubePlayerViewController" bundle:bundle];
        [v setVideoId:videoId];
        [v setOptions:options];
        
        [root presentViewController:v animated:YES completion:nil];
    });
}

@end
