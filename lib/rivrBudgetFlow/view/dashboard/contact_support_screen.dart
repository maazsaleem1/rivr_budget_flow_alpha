import 'package:flutter/material.dart';

class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        elevation: 0,
        title: const Text('Contact Support', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We’re here to help! Fill out the form below and our support team will get back to you as soon as possible.',
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(height: 24),
            _SupportTextField(controller: nameController, label: 'Name'),
            const SizedBox(height: 16),
            _SupportTextField(controller: emailController, label: 'Email'),
            const SizedBox(height: 16),
            _SupportTextField(controller: messageController, label: 'Message', maxLines: 5),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                onPressed: () {},
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    child: const Text('Send', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Divider(color: Color(0x339CA3AF)),
            const SizedBox(height: 12),
            const Text('Or reach us at:', style: TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 6),
            Row(
              children: const [
                Icon(Icons.email, color: Color(0xFF00D1E9), size: 20),
                SizedBox(width: 8),
                Text('support@rivrapp.com', style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: const [
                Icon(Icons.phone, color: Color(0xFF00D1E9), size: 20),
                SizedBox(width: 8),
                Text('+1 234 567 890', style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SupportTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;
  const _SupportTextField({required this.controller, required this.label, this.maxLines = 1});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF1F2937),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
