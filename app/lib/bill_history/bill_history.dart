import 'package:ai_trolley/bill_history/bill_card.dart';
import 'package:ai_trolley/utils/firebase_utils.dart';
import 'package:flutter/material.dart';

class BillHistory extends StatefulWidget {
  const BillHistory({super.key});

  @override
  State<BillHistory> createState() => _BillHistoryState();
}

class _BillHistoryState extends State<BillHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder(
            future: FirebaseUtils.getBills(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return BillCard(bill: snapshot.data![i]);
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
