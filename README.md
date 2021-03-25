# itunes audio player
![screenshot](https://i.imgur.com/X0f5HQf.png)

## Supported Devices

The code has been tested on:
1. Google Pixel 2 (Android)
2. IOS 12 Pro max simulator

## Supported Features
1. User can search songs by artist.
2. If results found, it will populate song list.
3. On click of song , audio player is activated. Audio player which persists throughout the lifetime
4. On click of song, song list indicates which song is being played
4. Audio player allows you to pause and play the song via a toggle button
5. Audio player allows you to go go back and forward the list via a previous and forward button
6. New search doesn't not affect the persistence of the audio player and it continues playing the existing song. However previous and forward buttons are disabled until a new song is selected from the list.
7. Always on portrait mode.

## Requirements to build the app
The application is dependent on a few external libraries .
1. `video_player` and `http` and flutter native libraries required for video playing capability and http requests respectively
2. `provider` and `get_it` are 3rd party libraries which are used for code architeure and to use the [provider pattern](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)
3. `network_image_mock` is used as dev dependency to mock network image in testing scripts

## Instructions to build and deploy the app.
 `video_player` related settings specific to android and ios have already been done. A reference could be found [here](https://pub.dev/packages/video_player#installation)
Steps to build and deploy
1. Ensure flutter 2.0+ installed
2. `git clone https://github.com/aboosoyeed/itunes_sample`
2. `cd itunes_sample`
3. `flutter pub get`
4. `flutter run`
5. To run test `flutter  test --machine test/widget_test.dart`
   This above command should ask you to select a device. Make sure you have a proper connected device or a simulator running. This can be tested by `flutter doctor`

