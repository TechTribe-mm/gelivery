import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  var isChecked = false.obs;
  var isLoading = false.obs;

  // Function to handle login
  Future<void> login() async {
    if (username.value.isNotEmpty &&
        password.value.isNotEmpty &&
        isChecked.value) {
      isLoading.value = true;

      // Simulate an API call with a delay
      await Future.delayed(const Duration(seconds: 2));

      // Check credentials (this is just a mock, replace with real API)
      if (username.value == 'valid' && password.value == '123456') {
        isLoading.value = false;
        Get.offNamed('/pickup'); // Navigate to the PickupPage
      } else {
        isLoading.value = false;
        Get.snackbar('Login Failed', 'Invalid username or password');
      }
    } else if (!isChecked.value) {
      Get.snackbar('Error', 'You must agree to the terms and conditions');
    } else {
      Get.snackbar('Error', 'Please enter all fields');
    }
  }
}
