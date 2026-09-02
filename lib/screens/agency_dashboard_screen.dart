import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'agency_hosts_screen.dart';
import 'agency_requests_screen.dart';
import 'target_management_screen.dart';
import 'agency_settings_screen.dart';

class AgencyDashboardScreen extends StatelessWidget {
  const AgencyDashboardScreen({super.key});

  static const bgDark = Color(0xFF0A0815);
  static const cardBg = Color(0xFF1A1530);
  static const purple = Color(0xFF7C4DFF);
  static const gold = Color(0xFFFFC107);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bgDark,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildHeader(context),
              const SizedBox(height: 16),
              _buildStatsRow(),
              const SizedBox(height: 16),
              _buildWeeklyStatsCard(),
              const SizedBox(height: 16),
              _buildChartCard(),
              const SizedBox(height: 16),
              _buildActionsGrid(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(Icons.chevron_right, color: Colors.white, size: 26),
        ),
        const Expanded(
          child: Text(
            'لوحة تحكم الوكالة',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 44),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF241A3E), Color(0xFF120C22)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(radius: 26, backgroundColor: purple.withValues(alpha: 0.3), child: const Icon(Icons.person, color: Colors.white)),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dream Agency', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('ID: 987654', style: TextStyle(color: Colors.white54, fontSize: 12)),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(color: gold.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
                child: Text('Lv.6', style: TextStyle(color: gold, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _statBox('إجمالي الدخل', '2,540,000', Icons.trending_up, Colors.greenAccent)),
              const SizedBox(width: 10),
              Expanded(child: _statBox('المضيفين', '56', Icons.people, Colors.lightBlueAccent)),
              const SizedBox(width: 10),
              Expanded(child: _statBox('الوكالات التابعة', '12', Icons.hub, purple)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statBox(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11), textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildWeeklyStatsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text('إحصائيات هذا الأسبوع', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.expand_more, color: Colors.white38, size: 18),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _weeklyItem('الدخل', '125.6K')),
              Expanded(child: _weeklyItem('الهدايا', '8,450')),
              Expanded(child: _weeklyItem('مضيفين جدد', '7')),
              Expanded(child: _weeklyItem('غرف نشطة', '42')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weeklyItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
      ],
    );
  }

  Widget _buildChartCard() {
    final spots = const [
      FlSpot(0, 30), FlSpot(1, 45), FlSpot(2, 38), FlSpot(3, 60),
      FlSpot(4, 55), FlSpot(5, 78), FlSpot(6, 95),
    ];
    return Container(
      height: 220,
      padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(18)),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true, drawVerticalLine: false, horizontalInterval: 25, getDrawingHorizontalLine: (v) => FlLine(color: Colors.white.withValues(alpha: 0.06), strokeWidth: 1)),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 24,
                getTitlesWidget: (value, meta) {
                  const days = ['12/5', '13/5', '14/5', '15/5', '16/5', '17/5', '18/5'];
                  final i = value.toInt();
                  if (i < 0 || i >= days.length) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(days[i], style: const TextStyle(color: Colors.white38, fontSize: 10)),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minY: 0,
          maxY: 100,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              gradient: const LinearGradient(colors: [purple, Color(0xFFE91E8C)]),
              barWidth: 3,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(radius: 3, color: Colors.white, strokeWidth: 2, strokeColor: purple),
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [purple.withValues(alpha: 0.25), purple.withValues(alpha: 0.0)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionsGrid(BuildContext context) {
    final actions = [
      ('المضيفين', Icons.groups, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AgencyHostsScreen()))),
      ('الطلبات', Icons.assignment, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AgencyRequestsScreen()))),
      ('التاركتات', Icons.emoji_events, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TargetManagementScreen()))),
      ('الإعدادات', Icons.settings, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AgencySettingsScreen()))),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: actions.map((a) {
        return InkWell(
          onTap: a.$3,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(color: purple.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(16)),
                child: Icon(a.$2, color: purple, size: 24),
              ),
              const SizedBox(height: 6),
              Text(a.$1, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
