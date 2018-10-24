
# React Native Youtube Player [![npm version](https://badge.fury.io/js/react-native-youtube-player.svg)](https://badge.fury.io/js/react-native-youtube-player) [![npm](https://img.shields.io/npm/dt/react-native-youtube-player.svg)](https://www.npmjs.org/package/react-native-youtube-player) ![MIT](https://img.shields.io/dub/l/vibe-d.svg) ![Platform - Android and iOS](https://img.shields.io/badge/platform-Android%20%7C%20iOS-yellow.svg)

A React Native module that allows you to play YouTube videos from React Native Apps.


## Table of contents
- [Install](#install)
- [Usage](#usage)
- [Direct launch](#directly-launching-the-camera-or-image-library)
- [Options](#options)
- [Response object](#the-response-object)

## Install

### NOTE: THIS PACKAGE IS NOW BUILT FOR REACT NATIVE 0.40 OR GREATER! IF YOU NEED TO SUPPORT REACT NATIVE < 0.40, YOU SHOULD INSTALL THIS PACKAGE `@0.24`

`npm install react-native-youtube-player@latest --save`

### Automatic Installation

`react-native link`

IMPORTANT NOTE: You'll still need to perform step 4 and 5 for iOS and steps 2, 3, and 5 for Android of the manual instructions below.

### Manual Installation

#### iOS

1. In the XCode's "Project navigator", right click on your project's Libraries folder ➜ `Add Files to <...>`
2. Go to `node_modules` ➜ `react-native-youtube-player` ➜ `ios` ➜ select `RNYoutubePlayer.xcodeproj`
3. Add `RNYoutubePlayer.a` to `Build Phases -> Link Binary With Libraries`
4. For iOS verify your ATS configuration
5. Drag and Drop "YTPlayerView-iframe-player.html" and "YoutubePlayerViewController.xib" to your main project (in Xcode). Copy those files. You can customize the XIB file in order to localize for example.
6. Compile and have fun

#### Android
1. Add the following lines to `android/settings.gradle`:
    ```gradle
    include ':react-native-youtube-player'
    project(':react-native-youtube-player').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-youtube-player/android')
    ```
    
2. Update the android build tools version to `2.2.+` in `android/build.gradle`:
    ```gradle
    buildscript {
        ...
        dependencies {
            classpath 'com.android.tools.build:gradle:2.2.+' // <- USE 2.2.+ version
        }
        ...
    }
    ...
    ``` 
    
3. Update the gradle version to `2.14.1` in `android/gradle/wrapper/gradle-wrapper.properties`:
    ```
    ...
    distributionUrl=https\://services.gradle.org/distributions/gradle-2.14.1-all.zip
    ```
    
4. Add the compile line to the dependencies in `android/app/build.gradle`:
    ```gradle
    dependencies {
        compile project(':react-native-youtube-player')
    }
    ```
    
5. Add the required permissions in `AndroidManifest.xml`:
    ```xml
    <uses-permission android:name="android.permission.INTERNET" />
    ```
    
6. Add the import and link the package in `MainApplication.java`:
    ```java
    import ar.com.ezequielaceto.reactnative.library.youtubeplayer.YoutubePlayerPackage; // <-- add this import

    public class MainApplication extends Application implements ReactApplication {
        @Override
        protected List<ReactPackage> getPackages() {
            return Arrays.<ReactPackage>asList(
                new MainReactPackage(),
                new YoutubePlayerPackage()
            );
        }
    }
    ```

```
This code allows to pass result of request permissions to native part.

## Usage

```javascript
var YoutubePlayer = require('react-native-youtube-player');

var options = {
  title: 'An example project'
};

YoutubePlayer.playVideo("youtube-video-id", options);
```javascript

