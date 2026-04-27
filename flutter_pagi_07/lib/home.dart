import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String username;
  Home({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $username"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Selamat datang di halaman home")],
        ),
      ),
    );
  }
}
