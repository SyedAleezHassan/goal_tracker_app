import 'package:flutter/material.dart';

import 'goal_screens/add_remove_goal.dart';

void main() {
  runApp(QuickGoalsTrackerApp());
}

class QuickGoalsTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Goals Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: GoalsScreen(),
    );
  }
}
