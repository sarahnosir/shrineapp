import 'package:flutter/material.dart';
import 'package:shrine_app/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernamecon = TextEditingController();
  final passwordcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('images/diamond.png'),
                const SizedBox(height: 16.0),
                Text(
                  'SHRINE',
                )
              ],
            ),
            const SizedBox(height: 120.0),
            TextField(
              controller: usernamecon,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kShrinePink300, width: 2),
                ),
                labelText: "Usename",
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordcon,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: const InputDecoration(
                  labelText: "Password",
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kShrinePink300, width: 2))),
            ),
            const SizedBox(
              height: 12,
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    usernamecon.clear();
                    passwordcon.clear();
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Next"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
