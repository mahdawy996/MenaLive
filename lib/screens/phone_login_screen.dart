import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  static const bgTop = Color.fromARGB(255, 28, 20, 55);
  static const bgBottom = Color.fromARGB(255, 10, 8, 25);
  static const primary = Color.fromARGB(255, 120, 70, 255);
  static const secondary = Color.fromARGB(255, 190, 185, 210);
  static const inputColor = Color.fromARGB(255, 40, 32, 70);

  final TextEditingController _phoneController = TextEditingController();
  String _countryCode = '+964';

  final List<Map<String, String>> _countries = const [
    {'name': 'العراق', 'code': '+964'},
    {'name': 'السعودية', 'code': '+966'},
    {'name': 'الإمارات', 'code': '+971'},
    {'name': 'الكويت', 'code': '+965'},
    {'name': 'قطر', 'code': '+974'},
    {'name': 'مصر', 'code': '+20'},
  ];

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: secondary),
      filled: true,
      fillColor: inputColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }

  void _showOtpDialog(String phone) {
    final codeController = TextEditingController();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: bgTop,
        title: const Text('رمز التحقق', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'أدخل رمز التحقق المرسل إلى واتساب\n$phone',
              textAlign: TextAlign.center,
              style: TextStyle(color: secondary),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 22),
              decoration: _inputDecoration('رمز التحقق'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              if (codeController.text.trim().length != 6) return;
              Navigator.pop(context);
              // TODO: التحقق من الرمز عبر خادم Mena Live
            },
            child: const Text('تحقق'),
          ),
        ],
      ),
    );
  }

  void _continue(String via) {
    final phone = _phoneController.text.trim();
    if (phone.length < 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('أدخل رقم الهاتف')),
      );
      return;
    }
    final fullNumber = '$_countryCode$phone';
    // TODO: استدعاء ApiClient لإرسال طلب OTP الحقيقي إلى الخادم
    _showOtpDialog(fullNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [bgTop, bgBottom],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.chevron_left, color: Colors.white, size: 40),
                    ),
                  ],
                ),
                const Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'أدخل رقم هاتفك للمتابعة',
                  style: TextStyle(color: secondary, fontSize: 15),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 82,
                      height: 52,
                      decoration: BoxDecoration(
                        color: inputColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _countryCode,
                          dropdownColor: const Color.fromARGB(255, 30, 24, 52),
                          isExpanded: true,
                          alignment: Alignment.center,
                          style: const TextStyle(color: Colors.white, fontSize: 13),
                          items: _countries
                              .map((c) => DropdownMenuItem(
                                    value: c['code'],
                                    child: Center(child: Text(c['code']!)),
                                  ))
                              .toList(),
                          onChanged: (v) => setState(() => _countryCode = v!),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(color: Colors.white, fontSize: 17),
                          decoration: _inputDecoration('رقم الهاتف'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton.icon(
                    onPressed: () => _continue('whatsapp'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Icon(Icons.chat, color: Colors.white),
                    label: const Text(
                      'المتابعة عبر واتساب',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => _continue('sms'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 52, 43, 82),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'المتابعة عبر الرسائل القصيرة',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'طرق تسجيل دخول أخرى',
                  style: TextStyle(color: secondary, fontSize: 14),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon(FontAwesomeIcons.google, 'Google', const Color(0xFFDB4437)),
                    _socialIcon(FontAwesomeIcons.facebookF, 'Facebook', const Color(0xFF1877F2)),
                    _socialIcon(FontAwesomeIcons.tiktok, 'TikTok', Colors.white),
                    _socialIcon(FontAwesomeIcons.snapchat, 'Snapchat', const Color(0xFFFFFC00)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, String name, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('فتح $name')),
          );
        },
        child: CircleAvatar(
          radius: 31,
          backgroundColor: Colors.white,
          child: FaIcon(icon, color: iconColor, size: 26),
        ),
      ),
    );
  }
}
