import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    required this.onToggle,
  });
  final VoidCallback onToggle;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _name = '';
  var _email = '';
  var _password = '';
  var _phone = '';
  var _address = '';
  var _confirmPassword = '';
  final _formKey = GlobalKey<FormState>();
  String? passwordValue;

  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });
  }

  void _trySubmitRegistrationForm() {
    final isFormValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
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
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController confirmPasswordController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController locationController = TextEditingController();
  // TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: imageXFile == null
                      ? null
                      : FileImage(File(imageXFile!.path)),
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(.3),
                  child: imageXFile == null
                      ? const Icon(
                          Icons.add_photo_alternate,
                          size: 50,
                          color: Colors.black54,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 6),
              TextButton.icon(
                onPressed: _getImage,
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Add a photo'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  key: const ValueKey('name'),
                  // controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: "Full name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length < 6 ||
                        value.contains(RegExp('[0-9]'))) {
                      return 'Please enter you full name';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _name = newValue!;
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  key: const ValueKey('email'),
                  // controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !value.contains(RegExp('[a-z@.]')) ||
                        value.length < 6) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  onSaved: (newValue) {
                    _email = newValue!;
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  key: const ValueKey('phone'),
                  // controller: phoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Phone",
                  ),
                  validator: (value) {
                    if (value!.length < 11 ||
                        value.contains(RegExp('[a-zA-Z.*-/|~]'))) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _phone = newValue!;
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  key: const ValueKey('password'),
                  // controller: passwordController,
                  obscureText: true,
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_open),
                    labelText: "Password",
                  ),
                  validator: (value) {
                    passwordValue = value;
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 8) {
                      return 'Please enter a minimum 8 digit password';
                    }
                    if (value.length > 32) {
                      return 'Please enter a memorable password';
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    _password = newValue!;
                  },
                ),
                const SizedBox(height: 6),
                TextFormField(
                  key: const ValueKey('confirmpassword'),
                  // controller: confirmPasswordController,
                  obscureText: true,
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Confirm Password",
                  ),
                  validator: (value) {
                    if (value != passwordValue) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _confirmPassword = newValue!;
                  },
                ),
                const SizedBox(height: 6),
                Stack(
                  children: [
                    TextFormField(
                      key: const ValueKey('address'),
                      enabled: true,
                      // controller: locationController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Add Address, press the icon",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your location';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _address = newValue!;
                      },
                    ),
                    Positioned(
                      right: 5,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_location_alt_rounded,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 130,
                child: OutlinedButton(
                  onPressed: widget.onToggle,
                  child: const Text("Login instead"),
                ),
              ),
              SizedBox(
                width: 130,
                child: ElevatedButton(
                  onPressed: _trySubmitRegistrationForm,
                  child: const Text("Register"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
