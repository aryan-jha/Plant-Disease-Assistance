import 'package:flutter/material.dart';

class PopupScreen extends StatelessWidget {
  static const String id = 'popup_screen';
  const PopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Popup screen")),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Splash Screen with buffer',
            style: TextStyle(fontSize: 25),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 400,
                  child: ElevatedButton(
                    child: const Text('phone number of executive'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              });
        },
        child: const Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
