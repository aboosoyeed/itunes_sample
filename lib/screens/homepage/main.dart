import 'package:flutter/material.dart';
import 'package:itunes/screens/homepage/artistSearchBox.dart';
import 'package:itunes/screens/homepage/songList.dart';
import 'package:itunes/screens/player/main.dart';
import 'package:itunes/services/playerController.dart';
import 'package:itunes/services/serviceLocator.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final playerController = SL<PlayerController>();

    return Scaffold(
        appBar: AppBar(
          title: ArtistSearchBox(),
        ),
        body: ChangeNotifierProvider.value(
          value: playerController,
          child: Consumer<PlayerController>(
            builder: (context, _, child){
              return Column(
                children: [
                  SongListWidget(),
                  if(playerController.controller!=null)AudioPlayer()
                ],
              );
            },
          ),
        )
    );
  }
}
