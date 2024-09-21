import 'package:flutter/material.dart';
import 'package:gelivery/controllers/pickup_controller.dart';
import 'package:gelivery/models/pickup_data.dart';
import 'package:gelivery/pages/widgets/spacing_widget.dart';
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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Obx(() {
        if (controller.isLoading.value && controller.pickupItems.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        return SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            enablePullDown: true,
            physics: BouncingScrollPhysics(),
            onLoading: () async {
              await Future.delayed(Duration(milliseconds: 1000));
              // //monitor fetch data from network
              // if (controller.pickupItems.length <
              //     controller.totalRecords.value) {
              //   // Defer fetchPickupList() until after build phase
              //   WidgetsBinding.instance.addPostFrameCallback((_) {
              //     controller.fetchPickupList();
              //     refreshController.loadNoData();
              //   });
              // }
            },
            onRefresh: () async {
              controller.fetchPickupList(refresh: true);
              await Future.delayed(Duration(milliseconds: 1000));
              debugPrint("please comming this one");
              refreshController.refreshCompleted();
            },
            child: ListView.builder(
                itemCount: controller.pickupItems.length + 1,
                // (controller.pickupItems.length <=
                //         controller.totalRecords.value
                //     ? 1
                //     : 0), // Prevent extra call
                itemBuilder: (context, index) {
                  debugPrint(
                      'Total Row Counts ${controller.totalRecords} itemcounts ${controller.pickupItems.length}');
                  if (index == controller.pickupItems.length) {
                    if (controller.pickupItems.length !=
                            controller.pickupItems.length &&
                        controller.pickupItems.length <
                            controller.totalRecords.value) {
                      // Defer fetchPickupList() until after build phase
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        controller.fetchPickupList();
                      });
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      refreshController.loadComplete();
                      return SizedBox.shrink(); // No more data to load
                    }
                  }

                  // Now safely access the item at the current index
                  final item = controller.pickupItems[index];
                  return itemBuilder(context, index, item);
                }));
      }),
    );
    // );
  }

  Widget text(text, double fontSize, Color color) {
    return Text('$text',
        style: TextStyle(
            fontSize: fontSize, color: color, fontWeight: FontWeight.bold));
  }

  Widget itemBuilder(BuildContext context, int index, PickupItem item) {
    var data = DateTime.parse(item.pickupDate);
    String formattedDate = '${data.day}/${data.month}/${data.year}';
    return Card(
      elevation: 2,
      color: Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        minVerticalPadding: 10,
        visualDensity: VisualDensity.comfortable,
        // minLeadingWidth: 40,

        leading: Container(
          width: MediaQuery.of(context).size.width / 3.5,
          child: Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(item.trackingId, 13.5, Colors.blue),
                  spacing(0.0, 14),
                  text('${item.osName}', 13.5, Colors.black),
                ],
              ),
            ],
          ),
        ),
        title: Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text('${item.osTownshipName}', 13.5, Colors.black),
                  spacing(0.0, 10),
                  text('${item.osPrimaryPhone}', 13.5, Colors.black),
                ],
              ),
            ],
          ),
        ),
        trailing: Wrap(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              text('$formattedDate', 13.5, Colors.black),
              spacing(0.0, 2),
              text('${item.totalWays} ways', 13.5, Colors.blue),
              spacing(0.0, 2),
              text("${index + 1} of ${controller.totalRecords}", 13.5,
                  Colors.black),
            ],
          ),
        ]),
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
