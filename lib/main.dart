import 'package:flutter/material.dart';
import 'package:gelivery/pages/login.dart';
import 'package:gelivery/pages/pickup_list.dart';
import 'package:gelivery/pages/widgets/pickup_tab_widget.dart';
// import 'package:gelivery/pages/tracking_lists.dart';
import 'package:gelivery/providers/login_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/pickup', page: () => PickUpTabBarWidget()),
      ],

      // home: LoginPage(),
      // routes: {
      //   '/pickup': (context) => const TrackingLists(), // Define Task 2 screen
      // },
    );
  }
}
