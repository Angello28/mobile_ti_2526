import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sore_12/auth_service.dart';
import 'package:flutter_sore_12/view/login.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({super.key, required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService authService = AuthService();
  TextEditingController namaController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref("learning").child(widget.user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: Text("Hello, ${widget.user.displayName}"),
        actions: [
          IconButton(
            onPressed: () async {
              await authService.signOut();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Logout berhasil")));
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: dbRef.onValue,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return const Center(child: Text("No Data to Display"));
          }

          Map<dynamic, dynamic> data =
              snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

          List items = data.entries.toList();

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];

              return ListTile(
                title: Text(item.value["nama"]),
                subtitle: Text(item.value["url"]),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Data"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: namaController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: urlController,
                      decoration: const InputDecoration(
                        labelText: "URL",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Batal"),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (namaController.text.isEmpty ||
                          urlController.text.isEmpty) {
                        return;
                      }

                      await dbRef.push().set({
                        "nama": namaController.text,
                        "url": urlController.text,
                      });

                      namaController.clear();
                      urlController.clear();

                      Navigator.of(context).pop();
                    },
                    child: const Text("Simpan"),
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
