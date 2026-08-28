import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const bgDark = Color(0xFF0A0815);
  static const cardBg = Color(0xFF1A1530);
  static const purple = Color(0xFF7C4DFF);
  static const pink = Color(0xFFE91E8C);

  final String userId = '1012153';
  int _currentTab = 4; // الرئيسية (home) مفعّل افتراضياً

  void _copyId() {
    Clipboard.setData(ClipboardData(text: userId));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم نسخ رقم الـ ID'), duration: Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDark,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopBar(),
                    const SizedBox(height: 10),
                    _buildProfileCard(),
                    const SizedBox(height: 16),
                    _buildFollowStatsRow(),
                    const SizedBox(height: 14),
                    _buildCurrencyRow(),
                    const SizedBox(height: 14),
                    _buildAgencyBanner(),
                    const SizedBox(height: 18),
                    _buildIconGrid(),
                    const SizedBox(height: 18),
                    _buildListItem(
                      icon: Icons.home_filled,
                      iconColor: purple,
                      title: 'غرفتي',
                      subtitle: 'إدارة غرفتي والبث المباشر',
                      onTap: () {},
                    ),
                    _buildListItem(
                      icon: Icons.headset_mic,
                      iconColor: Colors.lightBlueAccent,
                      title: 'خدمة العملاء',
                      subtitle: 'تواصل مع فريق الدعم',
                      onTap: () {},
                    ),
                    _buildListItem(
                      icon: Icons.settings,
                      iconColor: Colors.orangeAccent,
                      title: 'الإعدادات',
                      subtitle: 'الحساب والخصوصية والإشعارات',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.maybePop(context),
            icon: const Icon(Icons.chevron_left, color: Colors.white, size: 30),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_outlined, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF241A3E), Color(0xFF120C22)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          'توت',
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.search, color: pink, size: 20),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFFFF8A00), Color(0xFFE91E8C)]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('👑', style: TextStyle(fontSize: 13)),
                          SizedBox(width: 4),
                          Text('VIP 3', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: _copyId,
                      child: Row(
                        children: [
                          Text('ID: $userId', style: const TextStyle(color: Colors.white70, fontSize: 13)),
                          const SizedBox(width: 4),
                          const Icon(Icons.copy, color: Colors.white54, size: 14),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _statChip('18', Icons.person, Colors.pinkAccent),
                        const SizedBox(width: 6),
                        _statChip('25', Icons.diamond, Colors.lightBlueAccent),
                        const SizedBox(width: 6),
                        _statChip('Lv.27', Icons.local_fire_department, Colors.orangeAccent),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Flexible(
                          child: Text(
                            'أجعل يومك سعيداً دائماً',
                            style: TextStyle(color: Colors.white60, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.edit, color: purple, size: 14),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: purple, width: 2),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFF3A2E5C),
                      child: Icon(Icons.person, color: Colors.white54, size: 40),
                    ),
                  ),
                  Positioned(
                    bottom: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: purple,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _statChip(String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(width: 4),
          Icon(icon, color: color, size: 14),
        ],
      ),
    );
  }

  Widget _buildFollowStatsRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _followStat('4', 'المعجيون', Icons.favorite, Colors.pinkAccent),
          _followStat('5', 'تم تابع', Icons.person_add, Colors.lightBlueAccent),
          _followStat('3', 'الأصدقاء', Icons.people, Colors.amber),
        ],
      ),
    );
  }

  Widget _followStat(String value, String label, IconData icon, Color color) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(width: 6),
            Icon(icon, color: color, size: 20),
          ],
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 13)),
      ],
    );
  }

  Widget _buildCurrencyRow() {
    return Row(
      children: [
        Expanded(child: _currencyCard('Diamonds', '114100', Icons.diamond, Colors.lightBlueAccent)),
        const SizedBox(width: 10),
        Expanded(child: _currencyCard('Xcoins', '0', Icons.monetization_on, Colors.amber)),
      ],
    );
  }

  Widget _currencyCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: color.withValues(alpha: 0.2), child: Icon(icon, color: color, size: 20)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white38),
        ],
      ),
    );
  }

  Widget _buildAgencyBanner() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF5A2E9E), Color(0xFF2E1653)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: purple.withValues(alpha: 0.5)),
        ),
        child: Row(
          children: [
            const Text('🎙️', style: TextStyle(fontSize: 30)),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'انضم الى وكالة وكن مذيعاً',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const Text('👑', style: TextStyle(fontSize: 26)),
            const Icon(Icons.chevron_left, color: Colors.white70),
          ],
        ),
      ),
    );
  }

  Widget _buildIconGrid() {
    final items = [
      _GridItem('المتجر', Icons.storefront, Colors.deepOrangeAccent),
      _GridItem('العلاقة', Icons.favorite, Colors.pinkAccent),
      _GridItem('مستوى', Icons.auto_awesome, Colors.greenAccent),
      _GridItem('VIP مركز', Icons.diamond, Colors.amber),
      _GridItem('مركز الألعاب', Icons.videogame_asset, Colors.lightBlueAccent),
      _GridItem('الحقيبة', Icons.work, Colors.purpleAccent),
      _GridItem('الهدايا', Icons.card_giftcard, Colors.pink),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: item.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(item.icon, color: item.color, size: 26),
              ),
              const SizedBox(height: 6),
              Text(item.label, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            CircleAvatar(backgroundColor: iconColor.withValues(alpha: 0.2), child: Icon(icon, color: iconColor, size: 20)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.chevron_left, color: Colors.white38),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      _NavItem(Icons.person, hasDot: true),
      _NavItem(Icons.chat_bubble_outline),
      _NavItem(Icons.sports_esports, hasDot: true),
      _NavItem(Icons.block),
      _NavItem(Icons.home),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF120C22),
        border: Border(top: BorderSide(color: Colors.white12)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (i) {
          final active = i == _currentTab;
          return InkWell(
            onTap: () => setState(() => _currentTab = i),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  items[i].icon,
                  color: active ? purple : Colors.white54,
                  size: 26,
                ),
                if (items[i].hasDot)
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(color: Colors.redAccent, shape: BoxShape.circle),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _GridItem {
  final String label;
  final IconData icon;
  final Color color;
  _GridItem(this.label, this.icon, this.color);
}

class _NavItem {
  final IconData icon;
  final bool hasDot;
  _NavItem(this.icon, {this.hasDot = false});
}
