import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/modules/content_module/contentcontroller.dart';
import 'package:todoapp/app/modules/home_module/homecontroller.dart';

class ContentPage extends GetWidget<ContentController> {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final homecontroller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Note Pad",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async {
                controller.isedit.value
                    ? controller.addOrEditData(isEdit: true)
                    : controller.addData();
                await homecontroller.fetchData();
              },
              child: Text(
                controller.isedit.value ? "Edit" : "Save",
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: controller.headingcontroller,
              decoration: InputDecoration(
                  hintText: "Enter Headline.....",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.2)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.2))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: controller.contentcontroller,
              maxLines: 20,
              decoration: InputDecoration(
                  hintText: "Enter content.....",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.2)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.2))),
            )
          ],
        ),
      ),
    );
  }
}
