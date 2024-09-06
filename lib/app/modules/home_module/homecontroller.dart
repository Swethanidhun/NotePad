import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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


 Future<void> deleteData(String heading) async {
    try {
      CollectionReference data = FirebaseFirestore.instance.collection('datas');

      QuerySnapshot snapshot = await data
          .where('heading', isEqualTo: heading)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Delete the first document that matches the heading
        await snapshot.docs.first.reference.delete();
        Get.showSnackbar(const GetSnackBar(
          message: "Data Deleted Successfully",
        ));
      }
    } catch (e) {
      print('Error deleting data: $e');
      Get.showSnackbar(GetSnackBar(
        message: "Error: $e",
      ));
    }
    // Refresh data after deletion
    fetchData();
  }
  @override
  void onReady() {
    super.onReady();
    fetchData();
  }
}
