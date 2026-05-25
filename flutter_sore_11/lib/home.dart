import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
        .get("https://6a142bd86c7db8aac053f9eb.mockapi.io/api/v1/todos");
    if (res.statusCode == 200) {
      final data = res.data;
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData || snapshot.data.isEmpty) {
              return const Center(child: Text("No data to display"));
            } else {
              final todos = snapshot.data;
              return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        value: todos[index]["done"],
                        title: Text(todos[index]["todoName"]),
                        secondary: IconButton(
                            onPressed: () async {
                              await dio.delete(
                                "https://6a142bd86c7db8aac053f9eb.mockapi.io/api/v1/todos/${todos[index]["id"]}",
                              );
                              getData();
                              setState(() {});
                            },
                            icon: Icon(Icons.delete)),
                        onChanged: (val) async {
                          await dio.put(
                              "https://6a142bd86c7db8aac053f9eb.mockapi.io/api/v1/todos/${todos[index]["id"]}",
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
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Todo Name"),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel")),
                    TextButton(
                        onPressed: () async {
                          final res = await dio.post(
                              "https://6a142bd86c7db8aac053f9eb.mockapi.io/api/v1/todos",
                              data: {
                                "todoName": todoController.text,
                                "done": false
                              });
                          if (res.statusCode == 201) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Todo Added")));
                            todoController.clear();
                            Navigator.of(context).pop();
                            getData();
                            setState(() {});
                          }
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
