import 'package:flutter/material.dart';

class StatusBadgeWidget extends StatelessWidget {
  final String status;

  // Constructor
  StatusBadgeWidget({@required this.status});

  /// Widget build
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (this.status == "regitered") ? Color(0xFF4caf50) : Color(0xFFe67e22),
      ),
    );
  }
}
