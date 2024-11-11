// import 'package:flutter/material.dart';

// class GoalTile extends StatelessWidget {
//   final String goal;
//   final VoidCallback onRemove;

//   GoalTile({required this.goal, required this.onRemove});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
//       child: ListTile(
//         title: Text(
//           goal,
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//         ),
//         trailing: IconButton(
//           icon: Icon(Icons.check_circle, color: Colors.greenAccent),
//           onPressed: onRemove,
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class FadeGoalTile extends StatefulWidget {
  final String goal;
  final VoidCallback onRemove;

  FadeGoalTile({required this.goal, required this.onRemove});

  @override
  _FadeGoalTileState createState() => _FadeGoalTileState();
}

class _FadeGoalTileState extends State<FadeGoalTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(_controller);
  }

  void _onGoalComplete() {
    _controller.forward().then((_) => widget.onRemove());
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: ListTile(
          title: Text(
            widget.goal,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          trailing: IconButton(
            icon: Icon(Icons.check_circle, color: Colors.greenAccent),
            onPressed: _onGoalComplete,
          ),
        ),
      ),
    );
  }
}
