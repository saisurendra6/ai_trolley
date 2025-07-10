import 'package:ai_trolley/bill_history/bill_item_model.dart';
import 'package:flutter/material.dart';

class BillItemCard extends StatelessWidget {
  final BillItemModel billItem;
  const BillItemCard({super.key, required this.billItem});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 100,
        child: Row(
          children: [
            CircleAvatar(
              radius: 36,
              child: Icon(
                Icons.local_grocery_store,
                size: 36,
                color: Colors.deepPurple.shade300,
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(billItem.item,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("${billItem.price} /-",
                      style: const TextStyle(fontSize: 20, letterSpacing: -1)),
                ],
              ),
            ),
            const Spacer(flex: 2),
            const Text("Qty: 1 ", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
