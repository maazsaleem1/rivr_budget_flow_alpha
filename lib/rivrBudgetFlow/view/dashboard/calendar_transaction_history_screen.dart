import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarTransactionHistoryScreen extends StatefulWidget {
  const CalendarTransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<CalendarTransactionHistoryScreen> createState() => _CalendarTransactionHistoryScreenState();
}

class _CalendarTransactionHistoryScreenState extends State<CalendarTransactionHistoryScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        elevation: 0,
        title: const Text('Calendar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              TableCalendar(
                firstDay: DateTime(2000),
                lastDay: DateTime(2100),
                focusedDay: selectedDate,
                currentDay: selectedDate,
                selectedDayPredicate: (day) => isSameDay(day, selectedDate),
                onDaySelected: (day, focusedDay) {
                  setState(() {
                    selectedDate = day;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(color: Color(0xFF374151), borderRadius: BorderRadius.circular(8)),
                  selectedDecoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  defaultTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.white),
                  todayTextStyle: TextStyle(color: Colors.white),
                  selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  outsideTextStyle: TextStyle(color: Color(0xFF6B7280)),
                ),
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                  rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) {
                    final text = DateFormat.E().format(day); // 'Sun', 'Mon', etc.
                    return Container(
                      alignment: Alignment.center,
                      child: Text(text, style: TextStyle(color: Color(0xFF9CA3AF), fontWeight: FontWeight.w600)),
                    );
                  },
                  defaultBuilder: (context, day, focusedDay) {
                    return Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(color: Color(0xFF1F2937), borderRadius: BorderRadius.circular(8)),
                      alignment: Alignment.center,
                      child: Text('${day.day}', style: TextStyle(color: Colors.white)),
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    return Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(color: Color(0xFF374151), borderRadius: BorderRadius.circular(8)),
                      alignment: Alignment.center,
                      child: Text('${day.day}', style: TextStyle(color: Colors.white)),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text('${day.day}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Text('Calendar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              const SizedBox(height: 12),
              ..._buildTransactionCards(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTransactionCards() {
    // Example data, replace with your actual transaction data
    final transactions = [
      {
        'title': 'Transactoin',
        'subtitle': 'sun Jun 29 2025 GMT+0000 (Coordinated Universal Time)',
        'amount': '-\$85.42',
        'amountColor': Colors.red,
        'icon': Icons.arrow_upward,
      },
      {
        'title': 'Transactoin',
        'subtitle': 'sun Jun 29 2025 GMT+0000 (Coordinated Universal Time)',
        'amount': '-\$85.42',
        'amountColor': Colors.red,
        'icon': Icons.arrow_upward,
      },
      {
        'title': 'Txn',
        'subtitle': 'sun Jun 29 2025 GMT+0000 (Coordinated Universal Time)',
        'amount': '-\$85.42',
        'amountColor': Colors.red,
        'icon': Icons.arrow_upward,
      },
      {
        'title': 'rebate',
        'subtitle': 'Sun Jun 29 2025 00:00:00 GMT+0000 (Coordinated Universal Time)',
        'amount': '+\$85.42',
        'amountColor': Colors.green,
        'icon': Icons.arrow_upward,
      },
    ];
    return transactions
        .map(
          (txn) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              decoration: BoxDecoration(color: const Color(0xFF1F2937), borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: txn['amountColor'] == Colors.red ? const Color(0xFF2563EB) : const Color(0xFF22C55D),
                  child: Icon(txn['icon'] as IconData, color: Colors.white),
                ),
                title: Text(txn['title'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                subtitle: Text(txn['subtitle'] as String, style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 12)),
                trailing: Text(
                  txn['amount'] as String,
                  style: TextStyle(color: txn['amountColor'] as Color, fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
