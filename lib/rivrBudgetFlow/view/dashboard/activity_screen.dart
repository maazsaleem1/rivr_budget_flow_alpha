import 'package:flutter/material.dart';
import '../../../widgets/inter_text.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121A28),
        elevation: 0,
        title: const InterText('Activity', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: const Center(
        child: InterText('Work is in progress', style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
