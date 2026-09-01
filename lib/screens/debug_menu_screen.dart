import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'phone_login_screen.dart';
import 'home_screen.dart';
import 'agency_dashboard_screen.dart';
import 'host_dashboard_screen.dart';
import 'target_management_screen.dart';

class DebugMenuScreen extends StatelessWidget {
  const DebugMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <String, Widget Function()>{
      'شاشة تسجيل الدخول': () => const LoginScreen(),
      'إدخال رقم الهاتف': () => const PhoneLoginScreen(),
      'الصفحة الرئيسية': () => const HomeScreen(),
      'لوحة تحكم الوكالة': () => const AgencyDashboardScreen(),
      'لوحة تحكم المضيف': () => const HostDashboardScreen(),
      'إدارة مستويات التاركت': () => const TargetManagementScreen(),
    };

    return Scaffold(
      backgroundColor: const Color(0xFF0A0815),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('قائمة الاختبار المؤقتة', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: items.entries.map((entry) {
          return Card(
            color: const Color(0xFF1A1530),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(entry.key, style: const TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.chevron_left, color: Colors.white38),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => entry.value()),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
