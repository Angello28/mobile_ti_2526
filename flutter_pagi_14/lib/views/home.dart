import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sore_12/auth_services.dart';
import 'package:flutter_sore_12/views/login.dart';

class Home extends StatelessWidget {
  final User user;
  const Home({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: Text("Welcome, ${user.displayName}"),
        actions: [
          IconButton(
            onPressed: () async {
              await AuthServices().signOut();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${user.displayName} berhasil logout")),
              );
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
