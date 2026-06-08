import 'package:flutter/material.dart';
import 'package:flutter_sore_6/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  late final SharedPreferences prefs;

  getPreferences() async {
    prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString("username");
    if (prefs.getString("username") != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home(username: username!)));
    }
  }

  @override
  void initState() {
    getPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Input Username"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await prefs.setString("username", usernameController.text);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) =>
                          Home(username: usernameController.text)));
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
