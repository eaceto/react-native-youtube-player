'use strict';

import {
    NativeModules
} from 'react-native';

const YoutubePlayerManager = NativeModules.YoutubePlayerManager || NativeModules.YoutubePlayerModule;

var RCTYoutubePlayerManagerExport = {
    playVideo: function(videoId, options={}) {
        console.log("YoutubePlayerManager is " + YoutubePlayerManager);
        console.log("YoutubePlayerManager.play is " + YoutubePlayerManager.play);
        YoutubePlayerManager.play(videoId, options);
    },

};

module.exports = RCTYoutubePlayerManagerExport;