import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/app/modules/home_module/homecontroller.dart';
import 'package:todoapp/app/routes/approutes.dart';

class ContentController extends GetxController {
  TextEditingController headingcontroller = TextEditingController();
  TextEditingController contentcontroller = TextEditingController();

  final CollectionReference _dataCollection =
      FirebaseFirestore.instance.collection('datas');

  addData() async {
    await _dataCollection.add({
      "heading": headingcontroller.text,
      "content": contentcontroller.text,
      "created_at": FieldValue.serverTimestamp()
    });
    Get.showSnackbar(const GetSnackBar(
      message: "Data Added Successfully",
    ));
    headingcontroller.clear();
    contentcontroller.clear();
    Get.toNamed(AppRoutes.homescreen);
  }

  List<Map<String, dynamic>> dataList = <Map<String, dynamic>>[].obs;

  Future<void> fetchData() async {
    try {
      CollectionReference data = FirebaseFirestore.instance.collection('datas');

      QuerySnapshot querySnapshot = await data.get();

      dataList.clear();

      for (var doc in querySnapshot.docs) {
        dataList.add(doc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  final isedit = false.obs;

  addOrEditData({required bool isEdit}) async {
    try {
      if (isEdit) {
        // Update existing data based on heading
        QuerySnapshot snapshot = await _dataCollection
            .where('heading', isEqualTo: headingcontroller.text)
            .get();

        if (snapshot.docs.isNotEmpty) {
          // Update the first document that matches the heading
          await snapshot.docs.first.reference.update({
            "content": contentcontroller.text,
            "updated_at": FieldValue.serverTimestamp(),
          });

          Get.showSnackbar(const GetSnackBar(
            message: "Data Updated Successfully",
          ));
        }
        Get.put(HomeController());
        final homecontroller = Get.find<HomeController>();
        homecontroller.fetchData();
        Get.toNamed(AppRoutes.homescreen);
      } else {
        // Add new data
        await _dataCollection.add({
          "heading": headingcontroller.text,
          "content": contentcontroller.text,
          "created_at": FieldValue.serverTimestamp()
        });

        Get.showSnackbar(const GetSnackBar(
          message: "Data Added Successfully",
        ));
      }
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: "Error: $e",
      ));
    }
  }

}
