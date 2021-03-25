import 'package:flutter/material.dart';
import 'package:itunes/model/artist.dart';
import 'package:itunes/model/song.dart';
import 'package:itunes/services/resource.dart';

class ITunes extends ChangeNotifier{

  List<Song> songList=<Song>[];
  List<Artist> artistList=<Artist>[];
  bool tracksNotFound = false;
  Song currentTrack;

  fetchSongs(String str) async{
    String url = "https://itunes.apple.com/search?term=$str&media=music&entity=song&attribute=artistTerm";
    final response = await Resource.get(url);
    List results = response['results'];

    songList = results.map((e) => Song(e)).toList();
    tracksNotFound = songList.length==0;

    notifyListeners();

  }


}