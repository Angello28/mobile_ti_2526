import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  String url;
  Detail({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(url), fit: BoxFit.fitWidth)),
      ),
    );
  }
}
