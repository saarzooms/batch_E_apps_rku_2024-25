import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController unmController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login Page'),
          TextField(
            controller: unmController,
            decoration: InputDecoration(
              hintText: 'Enter your username',
              labelText: 'Username',
            ),
          ),
          TextField(
            controller: pwdController,
            obscureText: isObscure,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  isObscure = !isObscure;
                  print(isObscure);
                  setState(() {});
                },
                icon: Icon(Icons.visibility_off),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(
                  'button clicked ${unmController.text} ${pwdController.text}');
              if (unmController.text == pwdController.text) {
                print('Welcome ${unmController.text}');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                );
              } else {
                print('Invalid Credentials');
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
