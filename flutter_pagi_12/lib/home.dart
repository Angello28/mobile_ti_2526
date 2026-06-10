import 'package:flutter/material.dart';
import 'package:flutter_sore_12/database_handler.dart';
import 'package:flutter_sore_12/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final String username;
  const Home({super.key, required this.username});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseHandler dbHandler = DatabaseHandler();
  TextEditingController namaController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  var item = [];

  void getData() async {
    item = await dbHandler.loadAllData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
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
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove("username");
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(item[index]["nama"]),
            subtitle: Text(item[index]["url"]),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Item"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: namaController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Input Nama",
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: urlController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Input URL",
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () async {
                      dbHandler.insertData({
                        "nama": namaController.text,
                        "url": urlController.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Item berhasil ditambahkan")),
                      );
                      getData();
                      Navigator.of(context).pop();
                    },
                    child: Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
