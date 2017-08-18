//
//  YoutubePlayerViewController.h
//  RNYoutubePlayer
//
//  Created by Kimi on 18/08/2017.
//  Copyright © 2017 Marc Shilling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YoutubePlayerViewController : UIViewController
@property (nonatomic, strong) NSString* videoId;
@property (nonatomic, strong) NSDictionary* options;
@end
