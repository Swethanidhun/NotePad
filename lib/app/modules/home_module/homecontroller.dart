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

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchData();
  }
}
