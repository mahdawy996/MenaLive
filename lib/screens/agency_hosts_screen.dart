import 'package:flutter/material.dart';
import 'host_dashboard_screen.dart';

class AgencyHostsScreen extends StatelessWidget {
  const AgencyHostsScreen({super.key});

  static const bgDark = Color(0xFF0A0815);
  static const cardBg = Color(0xFF1A1530);
  static const purple = Color(0xFF7C4DFF);

  @override
  Widget build(BuildContext context) {
    final hosts = [
      {'name': 'Mahdi', 'points': '56.8K', 'growth': '+12.5%', 'active': true},
      {'name': 'Lina', 'points': '32.4K', 'growth': '+8.7%', 'active': true},
      {'name': 'Ahmed', 'points': '28.7K', 'growth': '+11.3%', 'active': true},
      {'name': 'Sara', 'points': '21.3K', 'growth': '+6.2%', 'active': true},
      {'name': 'Omar', 'points': '18.9K', 'growth': '+5.1%', 'active': false},
      {'name': 'Noor', 'points': '15.6K', 'growth': '+4.3%', 'active': false},
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bgDark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('مضيفي الوكالة', style: TextStyle(color: Colors.white)),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'بحث عن مضيف...',
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: cardBg,
                prefixIcon: const Icon(Icons.search, color: Colors.white38),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            ...hosts.map((h) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(14)),
                  child: ListTile(
                    leading: const CircleAvatar(backgroundColor: purple, child: Icon(Icons.person, color: Colors.white)),
                    title: Text(h['name'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    subtitle: Text((h['active'] as bool) ? 'نشط' : 'غير نشط', style: TextStyle(color: (h['active'] as bool) ? Colors.greenAccent : Colors.white38, fontSize: 12)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(h['points'] as String, style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                        Text(h['growth'] as String, style: const TextStyle(color: Colors.greenAccent, fontSize: 11)),
                      ],
                    ),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HostDashboardScreen())),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
