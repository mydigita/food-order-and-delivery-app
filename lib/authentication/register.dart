import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
                  radius: 60.0,
                  backgroundImage: imageXFile == null
                      ? null
                      : FileImage(File(imageXFile!.path)),
                  backgroundColor: Colors.pink,
                  child: imageXFile == null
                      ? const Icon(
                          Icons.add_photo_alternate,
                          size: 50,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_outlined),
                label: const Text('Take a photo'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelText: "Name",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone,
                        color: Theme.of(context).primaryColor),
                    labelText: "Phone",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock,
                          color: Theme.of(context).primaryColor),
                      labelText: "Password"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
