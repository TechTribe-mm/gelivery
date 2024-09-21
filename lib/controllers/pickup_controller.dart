import 'package:gelivery/models/pickup_data.dart';
import 'package:gelivery/providers/pickup_data_services.dart';
import 'package:get/get.dart';

class PickupController extends GetxController {
  var isLoading = false.obs;
  var pickupItems = <PickupItem>[].obs;
  var totalRecords = 0.obs;
  int first = 0;
  final int max = 10;

  final ApiService apiService = ApiService();

  @override
  void onInit() {
    super.onInit();
    fetchPickupList();
  }

  void fetchPickupList({bool refresh = false}) async {
    if (refresh) first = 0;
    isLoading(true);
    print("first $first max $max");
    try {
      final response = await apiService.getPickupList(first, max);
      totalRecords(response.totalRecords);
      if (refresh) {
        pickupItems.assignAll(response.items);
      } else {
        pickupItems.addAll(response.items);
      }
      first += max;
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    try {
      await apiService.logout();
      Get.offAllNamed('/login');
    } catch (e) {
      print('Error during logout: $e');
    }
  }
}
