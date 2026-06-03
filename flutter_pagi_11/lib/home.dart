import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dio = Dio();
  TextEditingController todoController = TextEditingController();

  Future<dynamic> getData() async {
    final res = await dio
        .get("https://6a1f8dd8b79eec0d6cf0da3e.mockapi.io/app/v1/todos");
    if (res.statusCode == 200) {
      final data = res.data;
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData ||
                snapshot.hasError ||
                snapshot.data.isEmpty) {
              return const Center(
                child: Text("Tidak ada yang ditampilkan"),
              );
            } else {
              final todos = snapshot.data;
              return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                        title: Text(todos[index]["todoName"]),
                        value: todos[index]["done"],
                        secondary: IconButton(
                          onPressed: () async {
                            await dio.delete(
                                "https://6a1f8dd8b79eec0d6cf0da3e.mockapi.io/app/v1/todos/${todos[index]["id"]}");
                            getData();
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (val) async {
                          await dio.put(
                              "https://6a1f8dd8b79eec0d6cf0da3e.mockapi.io/app/v1/todos/${todos[index]["id"]}",
                              data: {"done": val});
                          getData();
                          setState(() {});
                        });
                  });
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Todo"),
                  content: TextField(
                    controller: todoController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Todo Name"),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          todoController.clear();
                        },
                        child: const Text("Cancel")),
                    TextButton(
                        onPressed: () async {
                          final res = await dio.post(
                              "https://6a1f8dd8b79eec0d6cf0da3e.mockapi.io/app/v1/todos",
                              data: {
                                "todoName": todoController.text,
                                "done": false
                              });

                          if (res.statusCode == 201) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Kegiatan Berhasil Ditambahkan")));
                            todoController.clear();
                            Navigator.of(context).pop();
                            getData();
                            setState(() {});
                          }
                        },
                        child: const Text("Add")),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
