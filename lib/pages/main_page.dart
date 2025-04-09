import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
        //
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text("Welcome to the Main Page", style: TextStyle(fontSize: 24)),
              //
            ],
          ),
        ),
      ),
    );
  }
}
