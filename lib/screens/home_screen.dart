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
  int _currentTab = 4;

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
                      asset: 'my_room.png',
                      title: 'غرفتي',
                      subtitle: 'إدارة غرفتي والبث المباشر',
                      onTap: () {},
                    ),
                    _buildListItem(
                      asset: 'customer_service.png',
                      title: 'خدمة العملاء',
                      subtitle: 'تواصل مع فريق الدعم',
                      onTap: () {},
                    ),
                    _buildListItem(
                      asset: 'room_settings.png',
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
                icon: Image.asset('assets/icons/settings.png', width: 24, height: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 84,
                    height: 84,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: purple, width: 2),
                      boxShadow: [
                        BoxShadow(color: purple.withValues(alpha: 0.4), blurRadius: 14, spreadRadius: 1),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFF3A2E5C),
                      child: Icon(Icons.person, color: Colors.white54, size: 38),
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(color: purple, shape: BoxShape.circle),
                      child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text('توت', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 6),
                        Icon(Icons.search, color: pink, size: 18),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFFFF8A00), Color(0xFFE91E8C)]),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/icons/crown_badge.png', width: 14, height: 14),
                          const SizedBox(width: 4),
                          const Text('VIP 3', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: _copyId,
                      child: Row(
                        children: [
                          Text('ID: $userId', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                          const SizedBox(width: 4),
                          const Icon(Icons.copy, color: Colors.white54, size: 13),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _statChip('18', 'profile.png'),
              const SizedBox(width: 6),
              _statChip('25', 'diamond.png'),
              const SizedBox(width: 6),
              _statChip('Lv.27', 'ranking.png'),
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
    );
  }

  Widget _statChip(String value, String asset) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(width: 4),
          Image.asset('assets/icons/$asset', width: 16, height: 16),
        ],
      ),
    );
  }

  Widget _buildFollowStatsRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _followStat('4', 'المعجيون', 'heart.png'),
          _followStat('5', 'تم تابع', 'add_friend.png'),
          _followStat('3', 'الأصدقاء', 'groups.png'),
        ],
      ),
    );
  }

  Widget _followStat(String value, String label, String asset) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(width: 6),
            Image.asset('assets/icons/$asset', width: 20, height: 20),
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
        Expanded(child: _currencyCard('Diamonds', '114100', 'diamond.png')),
        const SizedBox(width: 10),
        Expanded(child: _currencyCard('Xcoins', '0', 'gold_coin.png')),
      ],
    );
  }

  Widget _currencyCard(String title, String value, String asset) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Image.asset('assets/icons/$asset', width: 32, height: 32),
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
      onTap: () => Navigator.pushNamed(context, '/agency'),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            Image.asset('assets/icons/gold_microphone.png', width: 40, height: 40),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'انضم الى وكالة وكن مذيعاً',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset('assets/icons/crown_badge.png', width: 34, height: 34),
            const Icon(Icons.chevron_left, color: Colors.white70),
          ],
        ),
      ),
    );
  }

  Widget _buildIconGrid() {
    final items = [
      _GridItem('المتجر', 'store.png'),
      _GridItem('العلاقة', 'heart.png'),
      _GridItem('مستوى', 'ranking.png'),
      _GridItem('VIP مركز', 'vip.png'),
      _GridItem('مركز الألعاب', 'games.png'),
      _GridItem('الحقيبة', 'treasure.png'),
      _GridItem('الهدايا', 'gifts.png'),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(18),
          child: Column(
            children: [
              Image.asset('assets/icons/${item.asset}', width: 54, height: 54, fit: BoxFit.contain),
              const SizedBox(height: 6),
              Text(item.label, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListItem({
    required String asset,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: cardBg, borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(8),
              child: Image.asset('assets/icons/$asset', fit: BoxFit.contain),
            ),
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
      _NavItem('profile.png', hasDot: true),
      _NavItem('messages.png'),
      _NavItem('games.png', hasDot: true),
      _NavItem('lock_room.png'),
      _NavItem('home.png'),
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
                Opacity(
                  opacity: active ? 1.0 : 0.55,
                  child: Image.asset('assets/icons/${items[i].asset}', width: 26, height: 26),
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
  final String asset;
  _GridItem(this.label, this.asset);
}

class _NavItem {
  final String asset;
  final bool hasDot;
  _NavItem(this.asset, {this.hasDot = false});
}
