//
//  YoutubePlayerViewController.m
//  RNYoutubePlayer
//
//  Created by Kimi on 18/08/2017.
//  Copyright © 2017 Marc Shilling. All rights reserved.
//

#import "YoutubePlayerViewController.h"
#import "YTPlayerView.h"

@interface YoutubePlayerViewController ()<YTPlayerViewDelegate>
@property(nonatomic, strong) YTPlayerView* playerWebView;
@property (weak, nonatomic) IBOutlet UIView *playerBaseView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;
@end

@implementation YoutubePlayerViewController
@synthesize videoId;
@synthesize options;

- (IBAction)closeViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _playerWebView = [YTPlayerView new];    
    [self.playerBaseView addSubview:_playerWebView];
    [_playerWebView setDelegate:self];
    
    [_playerWebView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSDictionary *views = @{@"playerWebView": _playerWebView};
    NSArray *horizontalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[playerWebView]-0-|" options:0 metrics:nil views:views];
    NSArray *verticalConstraints =[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[playerWebView]-0-|" options:0 metrics:nil views:views];
    [self.playerBaseView addConstraints:horizontalConstraints];
    [self.playerBaseView addConstraints:verticalConstraints];
    
    [self.playerBaseView setHidden:YES];
    [self.loadingView setHidden:NO];
    if (options != nil && options.count > 0) {
        [_playerWebView loadWithVideoId:videoId playerVars:options];
    } else {
        [_playerWebView loadWithVideoId:videoId];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playerViewDidBecomeReady:(nonnull YTPlayerView *)playerView {
    NSLog(@"playerViewDidBecomeReady");
    [self.playerBaseView setHidden:NO];
    [self.loadingView setHidden:YES];
}

/**
 * Callback invoked when player state has changed, e.g. stopped or started playback.
 *
 * @param playerView The YTPlayerView instance where playback state has changed.
 * @param state YTPlayerState designating the new playback state.
 */
- (void)playerView:(nonnull YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
    NSLog(@"didChangeToState");
}

/**
 * Callback invoked when playback quality has changed.
 *
 * @param playerView The YTPlayerView instance where playback quality has changed.
 * @param quality YTPlaybackQuality designating the new playback quality.
 */
- (void)playerView:(nonnull YTPlayerView *)playerView didChangeToQuality:(YTPlaybackQuality)quality {
    NSLog(@"didChangeToQuality");
}

/**
 * Callback invoked when an error has occured.
 *
 * @param playerView The YTPlayerView instance where the error has occurred.
 * @param error YTPlayerError containing the error state.
 */
- (void)playerView:(nonnull YTPlayerView *)playerView receivedError:(YTPlayerError)error {
    NSLog(@"playerReceivedError %@",error);
    
    //TODO show error and close
    [self closeViewController:playerView];
}

@end
