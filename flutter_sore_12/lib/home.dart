import 'package:flutter/material.dart';
import 'package:flutter_sore_6/database_handler.dart';
import 'package:flutter_sore_6/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final String username;
  const Home({super.key, required this.username});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController namaController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  final databaseHandler = DatabaseHandler();
  var items = [];

  getData() async {
    items = await databaseHandler.loadAllData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: Text("Welcome, ${widget.username}"),
        actions: [
          IconButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.remove("username");
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]["nama"]),
              subtitle: Text(items[index]["url"]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add item"),
                  content: Column(
                    children: [
                      TextField(
                        controller: namaController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Input Name"),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: urlController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Input Name"),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel")),
                    TextButton(
                        onPressed: () async {
                          await databaseHandler.insertData({
                            "nama": namaController.text,
                            "url": urlController.text
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Item berhasil ditambahkan")));
                          Navigator.of(context).pop();
                        },
                        child: Text("Add")),
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
