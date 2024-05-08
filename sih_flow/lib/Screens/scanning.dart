import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sih_flow/Screens/cure_screen.dart';

class ScanningScreen extends StatefulWidget {
  static const String id = 'scanning_screen';
  const ScanningScreen({super.key});

  @override
  State<ScanningScreen> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {
  // @override
  // ignore: must_call_super, annotate_overrides
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, CureScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Image(
          image: AssetImage("assets/images/giphy.gif"),
        )));
  }
}
