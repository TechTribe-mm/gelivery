import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gelivery/controllers/pickup_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PickupPage extends StatefulWidget {
  @override
  State<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  // static const routes = '/pickup';
  final PickupController controller = Get.put(PickupController());
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    debugPrint(
        'Total Row Counts ${controller.totalRecords} itemcounts ${controller.pickupItems.length}');
    return
        //  Scaffold(
        // appBar: AppBar(
        //   title: Text('Pickup List'),
        //   actions: [
        //     IconButton(
        //         icon: Icon(Icons.logout), onPressed: () => handleLogout(context)),
        //   ],
        // ),
        // body:
        Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        if (controller.isLoading.value && controller.pickupItems.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            enablePullDown: false,
            physics: BouncingScrollPhysics(),
            onLoading: () async {
              await Future.delayed(Duration(milliseconds: 1000));
              //monitor fetch data from network
              if (controller.pickupItems.length <
                  controller.totalRecords.value) {
                refreshController.loadNoData();
                Fluttertoast.showToast(msg: 'No more ways');
              }

              refreshController.loadComplete();
            },
            onRefresh: () async {
              controller.fetchPickupList(refresh: true);
              await Future.delayed(Duration(milliseconds: 1000));
              refreshController.refreshCompleted();
            },
            child: ListView.builder(
                itemCount: controller.pickupItems.length + 1,
                // (controller.pickupItems.length <=
                //         controller.totalRecords.value
                //     ? 1
                //     : 0), // Prevent extra call
                itemBuilder: (context, index) {
                  if (index == controller.pickupItems.length &&
                      controller.pickupItems.length <
                          controller.totalRecords.value) {
                    // Defer fetchPickupList() until after build phase
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      controller.fetchPickupList();
                    });
                    return Center(child: CircularProgressIndicator());
                  }

                  final item = controller.pickupItems[index];
                  return itemBuilder(context, index, item);
                })
            //     return ListTile(
            //       title: Text(item.trackingId),
            //       subtitle: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text('Sender: ${item.osName}'),
            //           Text('Phone: ${item.osPrimaryPhone}'),
            //           Text('Township: ${item.osTownshipName}'),
            //           Text('Date: ${item.pickupDate}'),
            //           Text('Ways: ${item.totalWays}'),
            //         ],
            //       ),
            //     );
            //   },
            // ),
            //  ListView.builder(
            //   itemCount: controller.pickupItems.length + 1,
            //   itemBuilder: (context, index) {
            //     if (index == controller.pickupItems.length) {
            //       if (controller.pickupItems.length <
            //           controller.totalRecords.value) {
            //         controller.fetchPickupList();
            //         return Center(child: CircularProgressIndicator());
            //       } else {
            //         return SizedBox.shrink();
            //       }
            //     }

            //     final item = controller.pickupItems[index];
            //     return ListTile(
            //       title: Text(item.trackingId),
            //       subtitle: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text('Sender: ${item.osName}'),
            //           Text('Phone: ${item.osPrimaryPhone}'),
            //           Text('Township: ${item.osTownshipName}'),
            //           Text('Date: ${item.pickupDate}'),
            //           Text('Ways: ${item.totalWays}'),
            //         ],
            //       ),
            //     );
            //   },
            // ),
            );
      }),
    );
    // );
  }

  Widget itemBuilder(BuildContext context, int index, item) {
    return InkWell(
      child: Card(
        elevation: 2,
        color: Colors.white,
        child: Center(
            child: ListTile(
          title: Text(item.trackingId),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sender: ${item.osName}'),
              Text('Phone: ${item.osPrimaryPhone}'),
              Text('Township: ${item.osTownshipName}'),
              Text('Date: ${item.pickupDate}'),
              Text('Ways: ${item.totalWays}'),
            ],
          ),
        )),
      ),
    );
  }

  Future<void> handleLogout(BuildContext context) async {
    try {
      await controller.logout();
      // Redirect to the Login page after successful logout
      Get.offAllNamed('/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }
}
