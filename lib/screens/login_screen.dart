import 'package:flutter/material.dart';
import 'phone_login_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const double designWidth = 691;
  static const double designHeight = 1536;

  void _openUrl(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('فتح $name')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final scaleX = constraints.maxWidth / designWidth;
          final scaleY = constraints.maxHeight / designHeight;
          final scale = scaleX > scaleY ? scaleX : scaleY;
          final imageWidth = designWidth * scale;
          final imageHeight = designHeight * scale;
          final left = (constraints.maxWidth - imageWidth) / 2;
          final top = (constraints.maxHeight - imageHeight) / 2;

          Widget hotspot(double x, double y, double w, double h, VoidCallback onTap) {
            return Positioned(
              left: left + x * scale,
              top: top + y * scale,
              width: w * scale,
              height: h * scale,
              child: GestureDetector(
                onTap: onTap,
                child: Container(color: Colors.transparent),
              ),
            );
          }

          return Stack(
            children: [
              Positioned(
                left: left,
                top: top,
                width: imageWidth,
                height: imageHeight,
                child: Image.asset(
                  'assets/images/login_background.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              hotspot(80, 905, 550, 105, () => _openUrl(context, 'Google')),
              hotspot(65, 1165, 120, 125, () => _openUrl(context, 'Facebook')),
              hotspot(205, 1165, 120, 125, () => _openUrl(context, 'TikTok')),
              hotspot(365, 1165, 120, 125, () => _openUrl(context, 'Snapchat')),
              hotspot(505, 1165, 120, 125, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PhoneLoginScreen()),
                );
              }),
              hotspot(170, 1320, 350, 100, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
