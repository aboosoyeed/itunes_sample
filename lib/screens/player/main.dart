
import 'package:flutter/material.dart';
import 'package:itunes/services/playerController.dart';
import 'package:itunes/services/serviceLocator.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';


class AudioPlayer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final playerController = SL<PlayerController>();

    return ChangeNotifierProvider.value(
      value: playerController,
      child: Consumer<PlayerController>(
        builder: (context, _, child){
          final _controller = playerController.controller;
          return Container(
            color: Colors.white70,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: () {
                      _controller.value.isPlaying
                          ? playerController.pause()
                          : playerController.play();
                    }
                ),
                Visibility(
                  visible: false,
                    child: VideoPlayer(_controller)
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
