import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final formatted = DateFormat('MMMM dd, yyyy').format(today);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        formatted,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
