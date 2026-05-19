import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sore_6/music_class.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<dynamic> getData() async {
    final response = await http.get(Uri.parse(
        "https://gist.githubusercontent.com/Angello28/b9a65c87a17cd7133da45d79b5e74116/raw/ae233decd02ad4eb28ed8ef3dc207b20266e9452/test.json"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map((music) => Music.fromJson(music)).toList();
    } else {
      throw Exception("Ada error saat mengambil data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pertemuan 10"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return Center(child: Text("Tidak ada data yang ditampilkan"));
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final music = snapshot.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(music.cover),
                      ),
                      title: Text(music.title),
                      subtitle: Text(music.artist),
                      trailing: Text(music.duration),
                    );
                  });
            }
          }),
    );
  }
}
