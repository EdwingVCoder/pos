import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/pages/home_page.dart';
import 'package:pos/utils.dart';

void main() async {
  await registerDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
