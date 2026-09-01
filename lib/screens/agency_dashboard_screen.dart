import 'package:flutter/material.dart';
import '../widgets/ui.dart';
class AgencyDashboardScreen extends StatelessWidget {const AgencyDashboardScreen({super.key});
 @override Widget build(BuildContext context)=>Directionality(textDirection:TextDirection.rtl,child:Scaffold(appBar:AppBar(title:const AppBarTitle('لوحة تحكم الوكالة')),body:ListView(padding:const EdgeInsets.all(14),children:[
  GlassCard(child:Row(children:[const CircleAvatar(radius:30,child:Icon(Icons.shield)),const SizedBox(width:12),const Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Dream Agency',style:TextStyle(fontSize:19,fontWeight:FontWeight.bold)),Text('ID: 987654 • المستوى 6',style:TextStyle(color:Colors.white60))])),const Icon(Icons.verified,color:cyan)])),const SizedBox(height:12),
  const Row(children:[Expanded(child:MetricCard(title:'إجمالي الدخل',value:'2.54M',icon:Icons.monetization_on,color:gold)),SizedBox(width:8),Expanded(child:MetricCard(title:'المضيفون',value:'56',icon:Icons.people,color:cyan))]),const SizedBox(height:8),
  const Row(children:[Expanded(child:MetricCard(title:'الغرف النشطة',value:'42',icon:Icons.mic,color:purple)),SizedBox(width:8),Expanded(child:MetricCard(title:'الهدايا',value:'125.6K',icon:Icons.card_giftcard,color:gold))]),const SizedBox(height:12),
  GlassCard(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('أداء الوكالة هذا الأسبوع',style:TextStyle(fontWeight:FontWeight.bold)),const SizedBox(height:16),SizedBox(height:130,child:CustomPaint(painter:_ChartPainter())),const SizedBox(height:12),ActionButton(label:'إدارة المضيفين',icon:Icons.groups,onTap:(){Navigator.pushNamed(context,'/host');})])),const SizedBox(height:12),
  ActionButton(label:'إدارة مستويات التاركت والمكافآت',icon:Icons.track_changes,onTap:(){Navigator.pushNamed(context,'/targets');})
 ])));
}
class _ChartPainter extends CustomPainter{ @override void paint(Canvas c,Size s){final p=Paint()..color=purple..strokeWidth=3..style=PaintingStyle.stroke;final path=Path()..moveTo(0,s.height*.7)..lineTo(s.width*.12,s.height*.62)..lineTo(s.width*.24,s.height*.68)..lineTo(s.width*.38,s.height*.42)..lineTo(s.width*.52,s.height*.55)..lineTo(s.width*.66,s.height*.25)..lineTo(s.width*.82,s.height*.36)..lineTo(s.width,s.height*.08);c.drawPath(path,p);} @override bool shouldRepaint(covariant CustomPainter old)=>false;}
