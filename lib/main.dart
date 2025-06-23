import 'package:card_play/src/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(    
         primarySwatch: Colors.blue,                                                                                                                            
        //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      
      home: const HomeView(),
    );
  }
}

