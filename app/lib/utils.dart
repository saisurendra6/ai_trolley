import 'package:ai_trolley/bill_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Utils {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<BillItem>> getBills() async {
    List<BillItem> res = [];

    try {
      //
      var col = firestore.collection("bill_id");
      var snapshot = await col.get();
      var data = snapshot.docs.map((doc) => doc.data()).toList();
      // print(data);
      for (int i = 0; i < data.length; i++) {
        res.add(BillItem.fromJson(data[i]));
      }
    } catch (e) {
      print(e);
    }

    print(res);
    return res;
  }

  Future<List<BillItem>> getBill(String billId) async {
    List<BillItem> res = [];
    return res;
  }
}
