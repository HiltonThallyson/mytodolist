import 'package:flutter/material.dart';

import '../utils/routes.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            const Text(
              'MENU',
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              leading: const Icon(Icons.note),
              title: const Text('My Tasks'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home),
            ),
            ListTile(
              leading: const Icon(Icons.task_alt),
              title: const Text('Completed Tasks'),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.completedTasks),
            ),
          ],
        ),
      ),
    );
  }
}
