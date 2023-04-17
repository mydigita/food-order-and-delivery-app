# Online Food Order and Delivery App

- Foodpanda clone app.

- Online Food Order and Delivery App

## Geolocator settings

1. Add the following to your "gradle.properties" file:

```gradle
android.useAndroidX=true
android.enableJetifier=true
```

2. Make sure you set the compileSdkVersion in your "android/app/build.gradle" file to 33:

```gradle
android {
  compileSdkVersion 33

  ...
}
```

- Caution: As of late 2021, most of the library ecosystem already supports AndroidX natively. This means that your project is most likely already using AndroidX libraries directly and there is no need to follow the steps in this migration guide. Additionally, the enableJetifier flag mentioned in this guide can lead to slower build times and should not be used unless it’s necessary.
  If your project already has the enableJetifier flag and it's turned on, you can run Build Analyzer’s Jetifier check to confirm if it’s actually needed. The Build Analyzer check is available starting in Android Studio Chipmunk.

## Permission

1. On Android you'll need to add either the ACCESS_COARSE_LOCATION or the ACCESS_FINE_LOCATION permission to your Android Manifest. To do so open the AndroidManifest.xml file (located under android/app/src/main) and add one of the following two lines as direct children of the <manifest> tag (when you configure both permissions the ACCESS_FINE_LOCATION will be used by the geolocator plugin):

```dart
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

2. Starting from Android 10 you need to add the ACCESS_BACKGROUND_LOCATION permission (next to the ACCESS_COARSE_LOCATION or the ACCESS_FINE_LOCATION permission) if you want to continue receiving updates even when your App is running in the background (note that the geolocator plugin doesn't support receiving and processing location updates while running in the background):

```
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
```
