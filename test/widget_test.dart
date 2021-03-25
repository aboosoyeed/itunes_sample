// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:itunes/main.dart';
import 'package:itunes/model/song.dart';
import 'package:itunes/screens/homepage/artistSearchBox.dart';
import 'package:itunes/screens/homepage/songTile.dart';
import 'package:itunes/screens/player/main.dart';
import 'package:itunes/services/itunes.dart';
import 'package:itunes/services/serviceLocator.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'response.dart';

void main() {
  setUpServiceLocator();

  testWidgets('Accurate Initial Screen ', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    final searchBox = find.byType(ArtistSearchBox);
    expect(searchBox, findsOneWidget);
    await tester.pump();
    final searchArtist = find.text("Search Artist");
    expect(searchArtist, findsWidgets);
    final audioPlayer = find.byType(AudioPlayer);
    expect(audioPlayer,findsNothing);
  });

  testWidgets('Shows no results', (WidgetTester tester) async {
    // Mock no results
    final itunes= SL<ITunes>();
    itunes.songList = [];
    itunes.tracksNotFound = true;

    await tester.pumpWidget(MyApp());
    final noResults = find.text("No Artist Found");
    expect(noResults, findsOneWidget);

  });

  testWidgets('Valid Response : Populates songs', (WidgetTester tester) async {
    mockResponse();
    mockNetworkImagesFor(()async{
      await tester.pumpWidget(MyApp());
      final songTiles = find.byType(SongTileWidget);
      expect(songTiles, findsWidgets);
    });
  });


  testWidgets('On Click song, AudioPlayer and play icon appears', (WidgetTester tester) async {
    mockResponse();
    mockNetworkImagesFor(()async{
      await tester.pumpWidget(MyApp());
      final songTiles = find.byType(SongTileWidget);
      final firstSong = songTiles.first;
      await tester.tap(firstSong);
      await tester.pumpAndSettle();
      final icon = find.byIcon(Icons.graphic_eq);
      final audioPlayer = find.byType(AudioPlayer);
      expect(icon, findsOneWidget);
      expect(audioPlayer, findsOneWidget);

    });
  });



}

mockResponse(){

  final response = API_RESPONSE;
  List results = response['results'];
  final itunes= SL<ITunes>();
  itunes.songList = results.map((e) => Song(e)).toList();
  itunes.tracksNotFound = itunes.songList.length==0;

}