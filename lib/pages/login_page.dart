import 'package:flutter/material.dart';
import 'package:gelivery/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
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
                const SizedBox(height: 20),
                // Username TextField
                TextFormField(
                  onChanged: (value) => loginController.username.value = value,
                  decoration: const InputDecoration(
                    labelText: 'Username/Email',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20),
                // Password TextField
                TextFormField(
                  onChanged: (value) => loginController.password.value = value,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 30),
                // Terms and Conditions Checkbox
                Obx(() => CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: GestureDetector(
                        onTap: () =>
                            Get.snackbar('Terms', 'Terms and Conditions link'),
                        child: const Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      value: loginController.isChecked.value,
                      onChanged: (value) {
                        loginController.isChecked.value = value!;
                      },
                    )),
                const SizedBox(height: 30),
                // Login Button
                Obx(() => loginController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 9, 66, 113),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: loginController.login,
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
