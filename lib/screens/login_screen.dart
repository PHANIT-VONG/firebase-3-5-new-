import 'package:firebase_3_5/screens/home_screen.dart';
import 'package:firebase_3_5/services/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: email,
                style: Theme.of(context).textTheme.headline6,
                decoration: const InputDecoration(hintText: 'Enter username'),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: password,
                style: Theme.of(context).textTheme.headline6,
                decoration: const InputDecoration(hintText: 'Enter password'),
              ),
              const SizedBox(height: 30),
              CupertinoButton.filled(
                child: const Text('Login'),
                onPressed: () async {
                  bool? callBack = await AuthenticationService().login(
                    email.text.trim(),
                    password.text.trim(),
                  );
                  if (callBack != null && callBack) {
                    Get.off(const HomeScreen());
                  } else {
                    debugPrint('Login faile');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
