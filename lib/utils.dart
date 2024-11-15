// import 'package:http/http.dart' as http;

// class Utils {
//   String projectId = "ai-trolley-f8b2e";
//   String collectionId = "bill_id";
//   String baseUrl =
//       "https://firestore.googleapis.com/v1/projects/{project_id}/databases/(default)/documents/{collection_id}";

//   String accessToken =
//       "ya29.a0AeDClZB25XGbOcWM8OXaus7twbpkNBDV2trfDljVV_pbjHS-JfVFrqg6n6rWoVkqydCLuD2qy_Wz6fd9kpDIpkdSyFwyyJIysFzmjr7k5_HQGJzbLVQKh2IhvUai-dywnTdxlTWTgtN0eXJCBrswaj__GHBLIwRT0wlyLbX0GTZ7iItel7aakNPY9dkRhLlQFclsLO-wJ19USFpK2RKTPGkcoFTdum8VS25G5IQCypzMMt_hPTABR3vhQb9RELCsADXxBdcOpiVjHUcAucSH_W9wFTu5_1wabzMV08eJ24b8sOcPyqo3IzLrLNyX_TTuScFGt_2ZPVd0VWk_G1PDvDEkcTIzOLYKAK7ZrZIj09EnaDpy2tTnfFt6uQqJaD1aoiwQd1mTjpZ8EqIhd6h4_4mQ4Ee_N_gh5dIqaCgYKAXESARASFQHGX2MiplDvuYcNAiVdbn1fpl5-IA0427";

//   Map<String, String> head = {
//     "Authorization": "Bearer {access_token}",
//     "Content-Type": "application/json"
//   };

//   void addBill(List bill, double price) async {
//     print("adding bill.....");
//     List arr = [];
//     for (String val in bill) {
//       Map map = {"stringValue": val};
//       arr.add(map);
//     }
//     Map data = {
//       "fields": {
//         "user_id": {"stringValue": "user_id"},
//         "price": {"doubleValue": price},
//         "items": {
//           "arrayValue": {
//             "values": arr,
//           }
//         }
//       }
//     };

//     // response = requests.post(base_url, headers=headers, data=json.dumps(data))
//     try {
//       await http.post(Uri.parse("$baseUrl/user_id"), headers: head, body: data);
//     } catch (e) {
//       print(e);
//     }
//     // print("Create Document Response:", response.json())
//   }

//   Future<List<String>> getBills() async {
//     List<String> res = [];

//     try {
//       http.Response res = await http.get(Uri.parse(baseUrl), headers: head);
//       print("res");
//       print(res);
//     } catch (e) {
//       print(e);
//     }
//     return res;
//   }
// }

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
