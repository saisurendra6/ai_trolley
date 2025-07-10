import 'package:ai_trolley/bill_history/bill_item.dart';
import 'package:ai_trolley/bill_history/bill_model.dart';
import 'package:ai_trolley/utils/firebase_utils.dart';
import 'package:flutter/material.dart';

class BillItemsScreen extends StatefulWidget {
  final BillModel bill;
  const BillItemsScreen({super.key, required this.bill});

  @override
  State<BillItemsScreen> createState() => _BillItemsScreenState();
}

class _BillItemsScreenState extends State<BillItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bill.billId),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: FirebaseUtils.getBilledItems(widget.bill.billId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) =>
                        BillItemCard(billItem: snapshot.data![i]));
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
