import 'package:card_play/presentaion/initial_bindings/initial_binding.dart';
import 'package:card_play/presentaion/user_screen/user_list_screen.dart';
import 'package:card_play/src/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const UserListScreen(),
      initialBinding: InitialBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeView()),
        GetPage(name: '/userlist', page:() => const UserListScreen()),
      ],
      // home: const HomeView(),
    );
  }
}

