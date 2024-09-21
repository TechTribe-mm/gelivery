import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gelivery/pages/widgets/spacing_widget.dart';
import 'package:gelivery/providers/login_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Toggle checkbox state for accepting terms and conditions
  void _toggleTermsAndConditions(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  // Handle form submission
  void _validateAndSubmit(LoginProvider loginProvider) {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      // Ensure terms are accepted and fields are filled
      if (username.isNotEmpty && password.isNotEmpty && _isChecked) {
        loginProvider
            .login(jsonEncode({'username': username, 'password': password}))
            .then((response) {
          if (response == 'Login success') {
            Get.offNamed('/pickup');
          } else if (response == '400') {
            Fluttertoast.showToast(msg: 'Username or password is incorrect!');
          } else {
            Fluttertoast.showToast(msg: response); // Show error message
          }
        });
      } else if (!_isChecked) {
        Fluttertoast.showToast(msg: 'Please accept terms and conditions');
      }
    }
  }

  // Validate username field
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username, phone number, or email';
    }
    return null;
  }

  // Validate password field
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
                spacing(0.0, 10),
                // Username input
                TextFormField(
                  controller: _usernameController,
                  validator: _validateUsername,
                  decoration: const InputDecoration(
                    labelText: 'Username (or) Phone number/Email',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                spacing(0.0, 20),
                // Password input
                TextFormField(
                  controller: _passwordController,
                  validator: _validatePassword,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                spacing(0.0, 30),
                // Terms and conditions checkbox
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: RichText(
                      text: TextSpan(
                        text: 'Terms & Conditions',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrlString(
                              'https://www.gelivery.com.mm/contact.html?'),
                      ),
                    ),
                    value: _isChecked,
                    onChanged: _toggleTermsAndConditions,
                  ),
                ),
                spacing(0.0, 30),
                // Login button or loading indicator
                loginProvider.isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 9, 66, 113),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () => _validateAndSubmit(loginProvider),
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
