import 'package:ai_trolley/account/account_screen.dart';
import 'package:ai_trolley/bill_history/bill_history.dart';
import 'package:ai_trolley/home_page/home_page_card.dart';
import 'package:ai_trolley/trolley/trolley_view_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("S mart", style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            InkWell(
              child:
                  const HomePageCard(iconData: Icons.person, title: "Account"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen())),
            ),
            InkWell(
              child:
                  const HomePageCard(iconData: Icons.history, title: "Bills"),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BillHistory())),
            ),
            InkWell(
              child: const HomePageCard(
                  iconData: Icons.trolley, title: "Trolley View"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    icon: const Icon(Icons.trolley),
                    title: const Text("Enter Trolley id"),
                    content: TextField(
                      controller: _textController,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    actions: [
                      // cancel btn
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      // add btn
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TrolleyViewScreen(
                                      trolleyId: _textController.text)));
                        },
                        child: const Text('Continue'),
                      ),
                    ],
                  ),
                );
              },
            ),
            InkWell(
              child: const HomePageCard(iconData: Icons.info, title: "Info"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
