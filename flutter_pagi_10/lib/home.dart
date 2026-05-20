import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_pagi_10/detail.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<dynamic> getData() async {
    final response = await http.get(Uri.parse(
        "https://gist.githubusercontent.com/Angello28/8b68fb0e38a948fdca89b1c6270e67bb/raw/b1be6efe8036fa2a036d73410eccfda964b044bd/stones.json"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      print("Terjadi kesalahan saat mengambil data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Batupedia"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return const Center(child: Text("Tidak ada data yang ditampilkan"));
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(snapshot.data[index]["cover"]))),
                    ),
                    title: Text(snapshot.data[index]["nama"]),
                    subtitle: Text(snapshot.data[index]["kelangkaan"]),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => Detail(data: snapshot.data[index])));
                    },
                  );
                });
          }
        },
      ),
    );
  }
}
