import 'package:flutter/material.dart';
import 'screens/debug_menu_screen.dart';
import 'screens/agency_dashboard_screen.dart';
import 'screens/host_dashboard_screen.dart';
import 'screens/target_management_screen.dart';

void main() {
  runApp(const MenaLiveApp());
}

class MenaLiveApp extends StatelessWidget {
  const MenaLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mena Live',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const DebugMenuScreen(),
      routes: {
        '/agency': (_) => const AgencyDashboardScreen(),
        '/host': (_) => const HostDashboardScreen(),
        '/targets': (_) => const TargetManagementScreen(),
      },
    );
  }
}
