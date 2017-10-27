package ar.com.ezequielaceto.reactnative.library.youtubeplayer;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

import com.google.android.youtube.player.YouTubeStandalonePlayer;

public class YoutubePlayerManager extends ReactContextBaseJavaModule {
    private final ReactApplicationContext reactContext;

    private ReadableMap options;
    private String videoId;

    public YoutubePlayerManager(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "YoutubePlayerManager";
    }

    @ReactMethod
    public void play(final String videoId, final ReadableMap options) {
        Activity currentActivity = getCurrentActivity();

        Log.d(getName(), "[call] playVideoWithID. videoId: " + videoId + " - options: " + options);

        if (currentActivity == null) {
            return;
        }

        this.videoId = videoId;
        this.options = options;

        Intent intent = YouTubeStandalonePlayer.createVideoIntent(currentActivity, YoutubePlayerPackage.YoutubePublicAPIKey, videoId, 0 , true, false);
        currentActivity.startActivity(intent);
    }

    public Context getContext() {
        return getReactApplicationContext();
    }

    public @NonNull
    Activity getActivity() {
        return getCurrentActivity();
    }

}
