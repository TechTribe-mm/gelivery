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
  Future<void> handleLogout(BuildContext context, controller) async {
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
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
              centerTitle: true,
              title: Text('Pickup List', style: TextStyle(color: Colors.white)),
              backgroundColor: Color.fromARGB(255, 9, 66, 113),
              actions: [
                IconButton(
                    icon: Icon(Icons.logout, color: Colors.white),
                    onPressed: () => handleLogout(context, controller)),
              ],
              flexibleSpace: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      Color.fromARGB(255, 9, 66, 113),
                      Color.fromARGB(255, 9, 66, 113),
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
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
                      // margin: EdgeInsets.symmetric(horizontal: 2),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 20,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.28),
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                      ),
                      child: TabBar(
                        labelColor: Colors.black,
                        labelPadding: EdgeInsets.all(0),
                        unselectedLabelColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 167, 198, 224),
                        ),
                        tabs: [
                          Tab(
                            child: Text('Pickup Way',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 13,
                                  overflow: TextOverflow.clip,
                                )),
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
                      ),
                    ),
                  ))),
          body: TabBarView(
            children: [
              PickupPage(),
              PickupPage(),
              PickupPage(),
            ],
          ),
        ),
      ),
    );
  }
}
