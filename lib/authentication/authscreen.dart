import 'package:flutter/material.dart';
import './loginpage.dart';
import './registerpage.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Online Food Delivery'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                // icon: Icon(Icons.lock),
                text: 'Login',
              ),
              Tab(
                // icon: Icon(Icons.person),
                text: 'Register',
              ),
            ],
            indicatorColor: Colors.white,
            indicatorWeight: 5,
          ),
        ),
        body: Container(
          color: null,
          child: const TabBarView(children: [
            LoginPage(),
            RegisterPage(),
          ]),
        ),
      ),
    );
  }
}
