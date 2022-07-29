import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: const [
            Text(
              'MENU',
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
            Divider(
              thickness: 3,
            ),
          ],
        ),
      ),
    );
  }
}
