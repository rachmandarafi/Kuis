import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // inisiasi state
  String _username = "";
  String _password = "";
  bool isClicked = false;

  // function redirect
  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage(username: _username)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Column(
          children: [
            Image.asset("assets/logoUPN.png"),
            _usernameField(),
            _passwordField(),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _username = value;
          },
          decoration: InputDecoration(
              hintText: 'Username',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 90000, color: Colors.grey))),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          obscureText: true,
          onChanged: (value) {
            _password = value;
          },
          decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 90000, color: Colors.grey))),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: isClicked == true
              ? WidgetStateProperty.all(
                  const Color.fromARGB(255, 125, 214, 111))
              : WidgetStateProperty.all(
                  const Color.fromARGB(255, 170, 181, 188)),
        ),
        onPressed: () {
          if (_username == "admin" && _password == "123") {
            _navigateToHome();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Berhasil'),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            isClicked = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Gagal'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
