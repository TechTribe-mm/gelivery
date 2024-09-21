import 'package:flutter/material.dart';
import 'package:gelivery/controllers/pickup_controller.dart';
import 'package:gelivery/pages/pickup_list.dart';
import 'package:get/get.dart';

class PickUpTabBarWidget extends StatefulWidget {
  const PickUpTabBarWidget({super.key});

  @override
  State<PickUpTabBarWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PickUpTabBarWidget> {
  Future<void> handleLogout(
      BuildContext context, PickupController controller) async {
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

  @override
  Widget build(BuildContext context) {
    final PickupController controller = Get.put(PickupController());

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            const Color.fromARGB(255, 95, 164, 220),
            const Color.fromARGB(255, 47, 72, 94)
          ],
        ),
      ),
      child: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 90,
              title: Text('Pickup List', style: TextStyle(color: Colors.white)),
              backgroundColor: Color.fromARGB(255, 9, 66, 113),
              actions: [
                IconButton(
                    icon: Icon(Icons.logout, color: Colors.white),
                    onPressed: () => handleLogout(context, controller)),
              ],
              // flexibleSpace: Container(
              //   // padding: EdgeInsets.all(10),

              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.centerLeft,
              //       end: Alignment.centerRight,
              //       colors: <Color>[
              //         Color.fromARGB(255, 9, 66, 113),
              //         Color.fromARGB(255, 9, 66, 113),
              //       ],
              //     ),
              //   ),
              // ),
              bottom: PreferredSize(
                  preferredSize: TabBar(
                    // padding: EdgeInsets.all(30),
                    // indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding: EdgeInsets.all(0),
                    tabs: [
                      Tab(
                        child: Text(
                          'Pickup Way',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 13,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Pickup Completed',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 13,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Pickup Cancel',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 13,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                    ],
                  ).preferredSize,
                  child: ColoredBox(
                    color: Colors.transparent,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.28),
                        borderRadius: BorderRadius.circular(
                          0.0,
                        ),
                      ),
                      child: TabBar(
                        labelColor: Colors.white,
                        padding: EdgeInsets.only(top: 3, bottom: 3),
                        labelPadding: EdgeInsets.all(4),
                        unselectedLabelColor:
                            const Color.fromARGB(255, 13, 59, 82),

                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor:
                            const Color.fromARGB(255, 148, 205, 255),
                        // indicator: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(25),
                        //   color: Color.fromARGB(255, 167, 198, 224),
                        // ),
                        tabs: [
                          Tab(
                            child: Text('Pickup Way',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.clip,
                                )),
                          ),
                          Tab(
                            child: Text(
                              'Pickup Completed',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Pickup Cancel',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))),
          body: TabBarView(
            children: [
              Center(child: Text('PickUp way')),
              PickupPage(),
              Center(child: Text('PickUp Cancel')),
            ],
          ),
        ),
      ),
    );
  }
}
