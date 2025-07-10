import 'package:ai_trolley/bill_history/bill_items_screen.dart';
import 'package:ai_trolley/bill_history/bill_model.dart';
import 'package:flutter/material.dart';

class BillCard extends StatelessWidget {
  final BillModel bill;
  const BillCard({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BillItemsScreen(bill: bill))),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bill.billId,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        const Text(
                          "Price: ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                        Text(
                          "${bill.price}/-",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
