import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/routes/approutes.dart';

class SplashPage extends GetWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 5),
      () => Get.toNamed(AppRoutes.homescreen),
    );
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/post-it-note-2581479_1280.jpg"),
                  fit: BoxFit.cover)),
        ),
        const Positioned(
            child: Center(
                child: Text(
          "TODO APP",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
        )))
      ],
    ));
  }
}
