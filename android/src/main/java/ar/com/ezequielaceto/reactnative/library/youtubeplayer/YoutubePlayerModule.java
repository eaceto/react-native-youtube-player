package ar.com.ezequielaceto.reactnative.library.youtubeplayer;

import android.app.Activity;
import android.content.Context;
import android.support.annotation.NonNull;
import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

public class YoutubePlayerModule extends ReactContextBaseJavaModule {
  private final ReactApplicationContext reactContext;

  private ReadableMap options;
  private String videoId;

  public YoutubePlayerModule(ReactApplicationContext reactContext)
  {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "YoutubePlayerManager";
  }

  @ReactMethod
  public void playVideoWithID(final String videoId, final ReadableMap options) {
    Activity currentActivity = getCurrentActivity();

    Log.d(getName(), "[call] playVideoWithID. videoId: " + videoId + " - options: " + options);

    if (currentActivity == null)
    {
      return;
    }

    this.videoId = videoId;
    this.options = options;

  }

  public Context getContext()
  {
    return getReactApplicationContext();
  }

  public @NonNull Activity getActivity()
  {
    return getCurrentActivity();
  }

}
