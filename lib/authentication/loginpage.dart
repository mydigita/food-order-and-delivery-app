import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onToggle});
  final VoidCallback onToggle;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _email = '';
  var _password = '';
  final _formKey = GlobalKey<FormState>();
  void _tryLogin() {
    final isFormValid = _formKey.currentState!.validate();
    if (isFormValid) {
      _formKey.currentState!.save();
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 1,
          content: Container(
            color: null,
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Please provide correct information!',
                ),
              ],
            ),
          ),
          duration: const Duration(milliseconds: 1500),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height -
                Scaffold.of(context).appBarMaxHeight!.round() -
                20,
            left: 10,
            right: 10,
          ),
        ),
      );
    }
  }

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
                    onSaved: (newValue) {
                      _email = newValue!;
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
                    onSaved: (newValue) {
                      _password = newValue!;
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
                    onPressed: _tryLogin,
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
