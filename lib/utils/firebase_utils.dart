import 'package:ai_trolley/account/account_model.dart';
import 'package:ai_trolley/bill_history/bill_item_model.dart';
import 'package:ai_trolley/bill_history/bill_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUtils {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<List<BillModel>> getBills() async {
    try {
      var col = firestore.collection("bills");
      var snapshot = await col.get();
      return snapshot.docs
          .map((doc) => BillModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print(e);
    }
    return [];
  }

  static Future<AccountModel> getAccountDetails() async {
    try {
      var data = await firestore.collection("users").doc("uid1").get();
      Map<String, dynamic> map = data.data()!;
      return AccountModel(
          name: map['name'], email: map['email'], address: map['address']);
    } catch (e) {
      print(e);
    }
    return AccountModel(name: "name", email: "email", address: "address");
  }

  static Future<List<BillItemModel>> getBilledItems(String billId) async {
    try {
      var snapshot = await firestore
          .collection("bills")
          .doc(billId)
          .collection("items")
          .get();

      return snapshot.docs
          .map((doc) => BillItemModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print(e);
    }
    return [];
  }
}
