import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../widgets/animated_background.dart';

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
  String _dialCode = '+964';

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
        title: const Center(
          child: Text(
            'رمز التحقق',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'أدخل رمز التحقق المرسل إلى واتساب\n$phone',
              textAlign: TextAlign.center,
              style: TextStyle(color: secondary),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 4),
              decoration: _inputDecoration('••••••'),
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.cancel, color: Colors.redAccent, size: 34),
            tooltip: 'إلغاء',
          ),
          const SizedBox(width: 24),
          IconButton(
            onPressed: () {
              if (codeController.text.trim().length != 6) return;
              Navigator.pop(context);
              // TODO: التحقق من الرمز عبر خادم Mena Live
            },
            icon: const Icon(Icons.check_circle, color: Colors.greenAccent, size: 34),
            tooltip: 'تحقق',
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
    final fullNumber = '$_dialCode$phone';
    // TODO: استدعاء ApiClient لإرسال طلب OTP الحقيقي إلى الخادم
    _showOtpDialog(fullNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [bgTop, bgBottom],
              ),
            ),
          ),
          const Positioned.fill(child: AnimatedBackground()),
          SafeArea(
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
                        height: 52,
                        decoration: BoxDecoration(
                          color: inputColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: CountryCodePicker(
                          onChanged: (country) {
                            setState(() => _dialCode = country.dialCode ?? '+964');
                          },
                          initialSelection: 'IQ',
                          favorite: const ['IQ', 'SA', 'AE', 'KW', 'QA', 'EG'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          textStyle: const TextStyle(color: Colors.white, fontSize: 14),
                          dialogTextStyle: const TextStyle(color: Colors.black),
                          searchStyle: const TextStyle(color: Colors.black),
                          padding: EdgeInsets.zero,
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
                    child: ElevatedButton(
                      onPressed: () => _continue('whatsapp'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 22),
                          SizedBox(width: 10),
                          Text(
                            'المتابعة عبر واتساب',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
                      _socialIcon(FontAwesomeIcons.tiktok, 'TikTok', Colors.black),
                      _socialIcon(FontAwesomeIcons.snapchat, 'Snapchat', const Color(0xFFFFFC00)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(FaIconData icon, String name, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          // TODO: تسجيل دخول حقيقي عبر $name — يتحقق هل الحساب موجود أم ينشئ حساباً جديداً
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تسجيل الدخول عبر $name')),
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
