import 'package:flutter/material.dart';
import '../widgets/ui.dart';
class HostDashboardScreen extends StatelessWidget {const HostDashboardScreen({super.key});
 @override Widget build(BuildContext context)=>Directionality(textDirection:TextDirection.rtl,child:Scaffold(appBar:AppBar(title:const AppBarTitle('لوحة تحكم المضيف')),body:ListView(padding:const EdgeInsets.all(14),children:[
  GlassCard(child:Row(children:[const CircleAvatar(radius:30,child:Icon(Icons.person)),const SizedBox(width:12),const Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Mahdi 👑',style:TextStyle(fontSize:19,fontWeight:FontWeight.bold)),Text('VIP 8 • مضيف موثق',style:TextStyle(color:cyan))])),const Icon(Icons.verified,color:cyan)])),const SizedBox(height:12),
  GlassCard(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('التاركت الحالي',style:TextStyle(fontWeight:FontWeight.bold)),const SizedBox(height:8),const Text('120,450 / 200,000 عملة',style:TextStyle(color:gold,fontSize:17)),const SizedBox(height:8),const LinearProgressIndicator(value:.602,minHeight:10),const SizedBox(height:8),const Text('تبقى 79,550 للوصول إلى تاركت أول')])),const SizedBox(height:12),
  const Row(children:[Expanded(child:MetricCard(title:'أرباح الهدايا',value:'56.8K',icon:Icons.card_giftcard,color:gold)),SizedBox(width:8),Expanded(child:MetricCard(title:'عدد الساعات',value:'128',icon:Icons.schedule,color:cyan))]),const SizedBox(height:12),
  const Row(children:[Expanded(child:MetricCard(title:'الجلسات',value:'64',icon:Icons.mic,color:purple)),SizedBox(width:8),Expanded(child:MetricCard(title:'متوسط الساعة',value:'443',icon:Icons.show_chart,color:gold))]),const SizedBox(height:12),
  ActionButton(label:'عرض الهدايا والأرباح',icon:Icons.card_giftcard,onTap:(){}),const SizedBox(height:8),ActionButton(label:'عرض التاركت والمكافآت',icon:Icons.emoji_events,onTap:(){Navigator.pushNamed(context,'/targets');})
 ])));
}
