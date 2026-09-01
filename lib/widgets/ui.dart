import 'package:flutter/material.dart';

const purple = Color(0xFF7C2CFF);
const panel = Color(0xFF0B1530);
const cyan = Color(0xFF29D8FF);
const gold = Color(0xFFFFC34D);

class GlassCard extends StatelessWidget {
  final Widget child; final EdgeInsets padding;
  const GlassCard({super.key, required this.child, this.padding = const EdgeInsets.all(16)});
  @override Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      color: panel.withOpacity(.92), borderRadius: BorderRadius.circular(18),
      border: Border.all(color: purple.withOpacity(.22)),
      boxShadow: [BoxShadow(color: purple.withOpacity(.08), blurRadius: 18)],
    ), child: child);
}

class MetricCard extends StatelessWidget {
  final String title, value; final IconData icon; final Color color;
  const MetricCard({super.key, required this.title, required this.value, required this.icon, this.color = purple});
  @override Widget build(BuildContext context) => GlassCard(child: Row(children: [
    CircleAvatar(backgroundColor: color.withOpacity(.16), child: Icon(icon, color: color)),
    const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: Colors.white60, fontSize: 12)),
      const SizedBox(height: 3), Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
    ]))
  ]));
}

class AppBarTitle extends StatelessWidget { final String title; const AppBarTitle(this.title,{super.key});
  @override Widget build(BuildContext context) => Text(title, style: const TextStyle(fontWeight: FontWeight.w800)); }

class ActionButton extends StatelessWidget { final String label; final VoidCallback onTap; final IconData icon;
  const ActionButton({super.key, required this.label, required this.onTap, this.icon=Icons.arrow_forward_rounded});
  @override Widget build(BuildContext context)=>SizedBox(width: double.infinity, child: FilledButton.icon(onPressed:onTap, icon:Icon(icon), label:Padding(padding:const EdgeInsets.symmetric(vertical:12),child:Text(label)))); }
