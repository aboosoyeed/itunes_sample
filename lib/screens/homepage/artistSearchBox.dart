import 'package:flutter/material.dart';
import 'package:itunes/services/itunes.dart';
import 'package:itunes/services/serviceLocator.dart';

class ArtistSearchBox extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    controllerListener(context);

    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          hintText: 'Search Artist',
          fillColor: Colors.white,
          filled: true,
          contentPadding:
              new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
          suffixIcon: IconButton(
            onPressed: controller.clear,
            icon: Icon(Icons.clear),
          ),
        ),
      ),
    );
  }

  controllerListener(BuildContext context) {
    final itunes = SL<ITunes>();

    controller.addListener(() {
      String token = controller.text.trim();
      // A delay of
      Future.delayed(Duration(milliseconds: 500), () async {
        if (token == controller.text.trim() && token.length > 1) {
          try {
            await itunes.fetchSongs(token);
          } catch (e) {
            controller.text = "";
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                        e == "itunes_error" ? "Itunes Error" : "Network Error"),
                    content: Text("Please try again later"),
                    actions: [
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
            //print(e);
          }
        }
      });
    });
  }
}
