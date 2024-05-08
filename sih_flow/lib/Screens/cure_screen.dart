import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sih_flow/Screens/interface.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CureScreen extends StatelessWidget {
  static const String id = 'cure_screen';
  final Future<String> searchingInput;
  final FlutterTts flutterTts = FlutterTts();

  CureScreen({Key? key, required this.searchingInput}) : super(key: key);

  speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.25);
    await flutterTts.speak(text);
    // await flutterTts.stop();
  }

  void stop() async {
    await flutterTts.stop();
  }

  // ignore: prefer_typing_uninitialized_variables
  var answer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text("Cure Screen")),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_vert),
            onSelected: (int value) {
              if (value == 1) {
                // Handle sign-out action
                // You can call the sign-out function or navigate to the sign-out screen here
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<int>(
                value: 1,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InterfaceScreen()),
                    (route) => false,
                  );
                },
                child: const Text('Search New Querry'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<String>(
              future: searchingInput,
              builder: (context, snapshot) {
                answer = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while waiting for the API response
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // Show an error message if there's an error
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Display the data from the API
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 40)
                        .copyWith(top: 30),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(85, 156, 187, 157),
                      border: Border.all(
                          color: const Color.fromARGB(255, 21, 255, 0)),
                      borderRadius: BorderRadius.circular(20)
                          .copyWith(topLeft: Radius.zero),
                    ),
                    child: Text(
                      answer ?? 'TRY AGAIN PLEASE',
                      style: GoogleFonts.slabo13px(fontSize: 16),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
                onPressed: () => speak(answer),
                child: const Text("Click here to listen this")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: stop,
              child: const Text("Stop Listening"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a modal bottom sheet
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Contact Our Executive',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 100),
                    Text(
                        'For any other service or other help, \nYou can reach to our Executive.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.concertOne(
                          fontSize: 18,
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Call the function to make a phone call
                        makePhoneCall('1234567890');
                      },
                      child: const Text('Call Executive'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.call),
      ),
    );
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    // Handle error, e.g., show an error message
    // ignore: avoid_print
    print("Error launching phone call");
  }
}
