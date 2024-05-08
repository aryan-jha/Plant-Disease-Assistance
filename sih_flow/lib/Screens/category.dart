import 'package:flutter/material.dart';
import 'package:sih_flow/Screens/interface.dart';

class CategoryScreen extends StatelessWidget {
  static const String id = 'category_screen';
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Category screen")),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Search in Category',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 250,
          ),
          Center(
            child: Text(
              'All Crops/Plants category',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, InterfaceScreen.id);
        },
        child: const Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
