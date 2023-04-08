import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onToggle});
  final VoidCallback onToggle;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                'Welcome to foodyline!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Sell more foods and grow faster',
            style: TextStyle(fontSize: 17),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: const Icon(
              Icons.fingerprint,
              size: 120,
              color: Colors.black45,
            ),
          ),
          const SizedBox(height: 12),
          const Text('Login to continue...'),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: const ValueKey('useremail'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "User email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.') ||
                          value.length < 5) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    key: const ValueKey('password'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock_open),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          value.length < 7 ||
                          value.length > 32) {
                        return 'Enter is not valid';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  child: OutlinedButton(
                    onPressed: widget.onToggle,
                    child: const Text('Signup instead'),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
