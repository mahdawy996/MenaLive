import 'package:flutter/material.dart';

class AgencyRequestsScreen extends StatelessWidget {
  const AgencyRequestsScreen({super.key});

  static const bgDark = Color(0xFF0A0815);
  static const cardBg = Color(0xFF1A1530);
  static const purple = Color(0xFF7C4DFF);

  @override
  Widget build(BuildContext context) {
    final requests = [
      {'name': 'Hassan', 'phone': '+964 770 111 2233', 'status': 'قيد المراجعة', 'time': 'قبل 20 دقيقة'},
      {'name': 'Rana', 'phone': '+964 770 222 3344', 'status': 'قيد المراجعة', 'time': 'منذ ساعة'},
      {'name': 'Yousef', 'phone': '+964 770 333 4455', 'status': 'جديد', 'time': 'منذ ساعتين'},
      {'name': 'Zainab', 'phone': '+964 770 444 5566', 'status': 'مقبول', 'time': 'منذ يوم'},
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bgDark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('طلبات الوكالة', style: TextStyle(color: Colors.white)),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: requests.map((r) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(14)),
                child: Row(
                  children: [
                    const CircleAvatar(backgroundColor: purple, child: Icon(Icons.person, color: Colors.white)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(r['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Text(r['phone']!, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                      ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(r['status']!, style: const TextStyle(color: Colors.amber, fontSize: 12)),
                        Text(r['time']!, style: const TextStyle(color: Colors.white38, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              )).toList(),
        ),
      ),
    );
  }
}
