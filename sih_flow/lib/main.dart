import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sih_flow/Screens/category.dart';
import 'package:sih_flow/Screens/interface.dart';
import 'package:sih_flow/Screens/login_screen.dart';
import 'package:sih_flow/Screens/logo_screen.dart';
import 'package:sih_flow/Screens/popup.dart';
import 'package:sih_flow/Screens/scanning.dart';
import 'package:sih_flow/Screens/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyD6N0SNRVzFonrVJr2UpG4OAoqrmP0jR1I",
        appId: "1:1058295522193:web:dc5b075161cc058dd2b030",
        messagingSenderId: "1058295522193",
        projectId: "miniprojectplants"),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LogoScreen.id: (context) => const LogoScreen(),
        LoginPage.id: (context) => LoginPage(),
        CategoryScreen.id: (context) => const CategoryScreen(),
        InterfaceScreen.id: (context) => const InterfaceScreen(),
        // CureScreen.id: (context) => const CureScreen(),
        PopupScreen.id: (context) => const PopupScreen(),
        ScanningScreen.id: (context) => const ScanningScreen(),
      },
    );
  }
}
