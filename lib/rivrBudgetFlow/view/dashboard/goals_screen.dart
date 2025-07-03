import 'package:flutter/material.dart';
import '../../../widgets/inter_text.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121A28),
        elevation: 0,
        title: const InterText('Goals', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: const Center(
        child: InterText('This is the Goals Screen (dummy data)', style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
