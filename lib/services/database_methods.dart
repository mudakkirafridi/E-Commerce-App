import 'package:cloud_firestore/cloud_firestore.dart';

class MyDatabaseMethod {
  Future addUserDetail(Map<String, dynamic> userInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfo);
  }

  Future addFoodToCart(Map<String, dynamic> userInfo, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('Cart')
        .add(userInfo);
  }

  //=================
  Future addFoodItem(Map<String, dynamic> userInfo, String name) async {
    return await FirebaseFirestore.instance.collection(name).add(userInfo);
  }

  Future<Stream<QuerySnapshot>> getFoodItem(String name) async {
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
}
