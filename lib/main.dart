import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'qr/qr_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(home: MainPage());
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: QrScreen(),
    );
  }
}
