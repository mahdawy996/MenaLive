import 'package:flutter/material.dart';

class AgencySettingsScreen extends StatelessWidget {
  const AgencySettingsScreen({super.key});

  static const bgDark = Color(0xFF0A0815);
  static const cardBg = Color(0xFF1A1530);

  @override
  Widget build(BuildContext context) {
    final items = [
      ('معلومات الوكالة', Icons.info_outline),
      ('إعدادات التاركتات', Icons.emoji_events_outlined),
      ('نسبة العمولة', Icons.percent),
      ('شروط الوكالة', Icons.description_outlined),
      ('طرق الدفع', Icons.payment),
      ('الأمان والخصوصية', Icons.shield_outlined),
      ('حظر المستخدمين', Icons.block),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bgDark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('الإعدادات', style: TextStyle(color: Colors.white)),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ...items.map((item) => Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Icon(item.$2, color: Colors.white70),
                    title: Text(item.$1, style: const TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.chevron_left, color: Colors.white38),
                    onTap: () {},
                  ),
                )),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('الإشعارات', style: TextStyle(color: Colors.white)),
                const Spacer(),
                Switch(value: true, onChanged: (_) {}, activeColor: const Color(0xFF7C4DFF)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
