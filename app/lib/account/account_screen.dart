import 'package:ai_trolley/account/account_model.dart';
import 'package:ai_trolley/utils/firebase_utils.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Account")),
      body: FutureBuilder(
          future: FirebaseUtils.getAccountDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              AccountModel acc = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(flex: 1),
                    CircleAvatar(
                      radius: 60,
                      child: Icon(
                        Icons.person,
                        size: 90,
                        color: Colors.deepPurple.withOpacity(0.7),
                      ),
                    ),
                    const Spacer(flex: 2),
                    Text(acc.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    const Spacer(flex: 1),
                    Text(
                      acc.email,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(flex: 1),
                    Text(
                      acc.address,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(flex: 4),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
