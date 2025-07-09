import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faqs = [
      'How do I add a new transaction?',
      'How do I create a budget?',
      'How do I connect my bank account?',
      'Is my financial data secure?',
    ];
    final helpTopics = [
      'How do I add a new transaction?',
      'How do I create a budget?',
      'How do I connect my bank account?',
      'Is my financial data secure?',
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121A28),
        elevation: 0,
        title: const Text('Help & Support', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Container(
              decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Color(0xFF9CA3AF)),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search for help topics...',
                        hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15),
                        isDense: true,
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            // FAQ Section
            Container(
              decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.help_outline_rounded, color: Color(0xFF00D1E9)),
                      SizedBox(width: 8),
                      Text('Frequently Asked Questions', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text('Find quick answers to common questions', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                  const SizedBox(height: 16),
                  ...faqs.map((q) => _FaqTile(question: q)).toList(),
                ],
              ),
            ),
            const SizedBox(height: 22),
            // Help Topics Section
            Container(
              decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.menu_book_rounded, color: Color(0xFF00D1E9)),
                      SizedBox(width: 8),
                      Text('Help Topics', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text('Browse help by category', style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 13)),
                  const SizedBox(height: 16),
                  ...helpTopics.map((t) => _HelpTopicTile(topic: t)).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqTile extends StatefulWidget {
  final String question;
  const _FaqTile({required this.question});
  @override
  State<_FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<_FaqTile> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(widget.question, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15)),
          trailing: Icon(expanded ? Icons.expand_less : Icons.expand_more, color: Colors.white),
          onTap: () => setState(() => expanded = !expanded),
        ),
        if (expanded)
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
            child: Text('Answer for: ${widget.question}', style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 14)),
          ),
        const Divider(color: Color(0xFF232D3A), height: 1),
      ],
    );
  }
}

class _HelpTopicTile extends StatelessWidget {
  final String topic;
  const _HelpTopicTile({required this.topic});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(topic, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white),
      onTap: () {},
    );
  }
}
