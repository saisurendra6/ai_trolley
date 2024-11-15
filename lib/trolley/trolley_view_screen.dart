import 'package:ai_trolley/bill_history/bill_item.dart';
import 'package:ai_trolley/bill_history/bill_item_model.dart';
import 'package:flutter/material.dart';

class TrolleyViewScreen extends StatefulWidget {
  final String trolleyId;
  const TrolleyViewScreen({super.key, required this.trolleyId});

  @override
  State<TrolleyViewScreen> createState() => _TrolleyViewScreenState();
}

class _TrolleyViewScreenState extends State<TrolleyViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.trolleyId),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) => BillItemCard(
          billItem: BillItemModel(item: "item", time: "", price: (100.0 * i)),
        ),
      ),
    );
  }
}
