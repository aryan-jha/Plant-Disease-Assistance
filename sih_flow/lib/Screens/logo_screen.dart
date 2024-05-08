import 'package:flutter/material.dart';
import 'package:sih_flow/Screens/login_screen.dart';

class LogoScreen extends StatefulWidget {
  static const String id = 'logo_screen';
  const LogoScreen({super.key});

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Image(
              // height: 200,
              // width: 200,
              image: AssetImage("assets/images/logo.jpg"),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 2, 152, 79),
                    borderRadius: BorderRadius.circular(15)),
                height: 50,
                width: 200,
                child: const Center(
                    child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
