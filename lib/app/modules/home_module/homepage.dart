import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/modules/content_module/contentcontroller.dart';
import 'package:todoapp/app/modules/home_module/homecontroller.dart';
import 'package:todoapp/app/routes/approutes.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContentController());
    final contentcontroller = Get.find<ContentController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.amber[50],
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.amber[200],
        onPressed: () {
          contentcontroller.isedit.value = false;
          contentcontroller.headingcontroller.clear();
          contentcontroller.contentcontroller.clear();
          Get.toNamed(AppRoutes.contentscreen);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("NotePad"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Obx(() => SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                    itemCount: controller.dataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  contentcontroller.headingcontroller.text =
                                      controller.dataList[index]["heading"];
                                  contentcontroller.contentcontroller.text =
                                      controller.dataList[index]["content"];
                                  contentcontroller.isedit.value = true;
                                  Get.toNamed(
                                    AppRoutes.contentscreen,
                                  );
                                },
                                child: Text(
                                  controller.dataList[index]["heading"],
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    controller.deleteData(controller
                                        .dataList[index]["heading"]);
                                  },
                                  child: const Icon(Icons.delete))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
