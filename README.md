
# React Native Youtube Player [![npm version](https://badge.fury.io/js/react-native-youtube-player.svg)](https://badge.fury.io/js/react-native-youtube-player) [![npm](https://img.shields.io/npm/dt/react-native-youtube-player.svg)](https://www.npmjs.org/package/react-native-youtube-player) ![MIT](https://img.shields.io/dub/l/vibe-d.svg) ![Platform - Android and iOS](https://img.shields.io/badge/platform-Android%20%7C%20iOS-yellow.svg) [![Gitter chat](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/react-native-youtube-player/Lobby)

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

IMPORTANT NOTE: You'll still need to perform step 4 for iOS and steps 2, 3, and 5 for Android of the manual instructions below.

### Manual Installation

#### iOS

1. In the XCode's "Project navigator", right click on your project's Libraries folder ➜ `Add Files to <...>`
2. Go to `node_modules` ➜ `react-native-youtube-player` ➜ `ios` ➜ select `RNYoutubePlayer.xcodeproj`
3. Add `RNYoutubePlayer.a` to `Build Phases -> Link Binary With Libraries`
4. For iOS verify your ATS configuration
5. Compile and have fun

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
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    ```
    
6. Add the import and link the package in `MainApplication.java`:
    ```java
    import com.imagepicker.ImagePickerPackage; // <-- add this import

    public class MainApplication extends Application implements ReactApplication {
        @Override
        protected List<ReactPackage> getPackages() {
            return Arrays.<ReactPackage>asList(
                new MainReactPackage(),
                new ImagePickerPackage() // <-- add this line
                // OR if you want to customize dialog style
                new ImagePickerPackage(R.style.my_dialog_style)
            );
        }
    }
    ```

##### Android (Optional)

Customization settings of dialog `android/app/res/values/themes.xml`:
```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="DefaultExplainingPermissionsTheme" parent="Theme.AppCompat.Light.Dialog.Alert">
        <!-- Used for the buttons -->
        <item name="colorAccent">@color/your_color</item>

        <!-- Used for the title and text -->
        <item name="android:textColorPrimary">@color/your_color</item>

        <!-- Used for the background -->
        <item name="android:background">@color/your_color</item>
    </style>
<resources>
```

If `MainActivity` is not instance of `ReactActivity`, you will need to implement `OnImagePickerPermissionsCallback` to `MainActivity`:
```java
import com.imagepicker.permissions.OnImagePickerPermissionsCallback; // <- add this import
import com.facebook.react.modules.core.PermissionListener; // <- add this import

public class MainActivity extends YourActivity implements OnImagePickerPermissionsCallback {
  private PermissionListener listener; // <- add this attribute

  // Your methods here

  // Copy from here

  @Override
  public void setPermissionListener(PermissionListener listener)
  {
    this.listener = listener;
  }

  @Override
  public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults)
  {
    if (listener != null)
    {
      listener.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }
    super.onRequestPermissionsResult(requestCode, permissions, grantResults);
  }

  // To here
}
```
This code allows to pass result of request permissions to native part.

## Usage

```javascript
var ImagePicker = require('react-native-youtube-player');

// More info on all the options is below in the README...just some common use cases shown here
var options = {
  title: 'Select Avatar',
  customButtons: [
    {name: 'fb', title: 'Choose Photo from Facebook'},
  ],
  storageOptions: {
    skipBackup: true,
    path: 'images'
  }
};

/**
 * The first arg is the options object for customization (it can also be null or omitted for default options),
 * The second arg is the callback which sends object: response (more info below in README)
 */
ImagePicker.showImagePicker(options, (response) => {
  console.log('Response = ', response);

  if (response.didCancel) {
    console.log('User cancelled image picker');
  }
  else if (response.error) {
    console.log('ImagePicker Error: ', response.error);
  }
  else if (response.customButton) {
    console.log('User tapped custom button: ', response.customButton);
  }
  else {
    let source = { uri: response.uri };

    // You can also display the image using data:
    // let source = { uri: 'data:image/jpeg;base64,' + response.data };

    this.setState({
      avatarSource: source
    });
  }
});
```
Then later, if you want to display this image in your render() method:
```javascript
<Image source={this.state.avatarSource} style={styles.uploadAvatar} />
```

### Directly Launching the Camera or Image Library

To Launch the Camera or Image Library directly (skipping the alert dialog) you can
do the following:
```javascript
// Launch Camera:
ImagePicker.launchCamera(options, (response)  => {
  // Same code as in above section!
});

// Open Image Library:
ImagePicker.launchImageLibrary(options, (response)  => {
  // Same code as in above section!
});
```
