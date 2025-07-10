import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  const HomePageCard({super.key, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 60,
              child:
                  Icon(iconData, size: 60, color: Colors.deepPurple.shade300),
            ),
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
