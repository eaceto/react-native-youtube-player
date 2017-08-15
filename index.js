'use strict'

const { NativeModules } = require('react-native');
const { YoutubePlayerManager } = NativeModules;

module.exports = {
  ...YoutubePlayerManager,
    playVideoWithID: function playVideoWithID(id, options) {
    return YoutubePlayerManager.playVideoWithID(id, {...options})
  }
}
