import 'package:flutter/material.dart';
import './loginpage.dart';
import './registerpage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 800),
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 50,
          automaticallyImplyLeading: false,
          title: const Text('Online Food Delivery'),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
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
          child: TabBarView(controller: _tabController, children: [
            LoginPage(
              onToggle: () => _tabController.index = 1,
            ),
            RegisterPage(
              onToggle: () => _tabController.index = 0,
            ),
          ]),
        ),
      ),
    );
  }
}
