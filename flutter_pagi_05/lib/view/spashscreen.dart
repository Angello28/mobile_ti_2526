import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_pagi_05/view/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void wait() async {
    await Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  void initState() {
    wait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My Pesanan",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(height: 20),
            SpinKitPouringHourGlass(
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
