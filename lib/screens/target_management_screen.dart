import 'package:flutter/material.dart';
import '../widgets/ui.dart';
class TargetManagementScreen extends StatefulWidget{const TargetManagementScreen({super.key});@override State<TargetManagementScreen> createState()=>_S();}
class _S extends State<TargetManagementScreen>{
 final levels=<Map<String,dynamic>>[
 {'name':'تاركت أول','coins':200000,'gold':50000,'diamonds':100,'days':7,'icon':Icons.workspace_premium},
 {'name':'تاركت ثاني','coins':500000,'gold':100000,'diamonds':200,'days':7,'icon':Icons.military_tech},
 {'name':'تاركت ثالث','coins':1000000,'gold':200000,'diamonds':300,'days':7,'icon':Icons.emoji_events},
 {'name':'تاركت رابع','coins':2000000,'gold':400000,'diamonds':500,'days':7,'icon':Icons.workspace_premium},
 {'name':'تاركت خامس','coins':5000000,'gold':800000,'diamonds':800,'days':7,'icon':Icons.stars},
 {'name':'تاركت سادس','coins':10000000,'gold':1500000,'diamonds':1000,'days':7,'icon':Icons.auto_awesome},
 ];
 @override Widget build(BuildContext context)=>Directionality(textDirection:TextDirection.rtl,child:Scaffold(appBar:AppBar(title:const AppBarTitle('إدارة مستويات التاركت والمكافآت')),body:ListView(padding:const EdgeInsets.all(14),children:[
  GlassCard(child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('قاعدة التاركت',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold,color:gold)),SizedBox(height:7),Text('يبدأ تاركت أول عند كسب 200,000 عملة من الهدايا، ثم تصعد المستويات حسب القيم التي تحددها الإدارة.'),SizedBox(height:8),Text('الأسعار وقيمة العملات والهدايا قابلة للتعديل بالكامل من إعدادات النظام.',style:TextStyle(color:Colors.white60))])),const SizedBox(height:12),
  ...levels.asMap().entries.map((e)=>Padding(padding:const EdgeInsets.only(bottom:8),child:GlassCard(child:ListTile(contentPadding:EdgeInsets.zero,leading:CircleAvatar(backgroundColor:gold.withOpacity(.14),child:Icon(e.value['icon'],color:gold)),title:Text(e.value['name'],style:const TextStyle(fontWeight:FontWeight.bold)),subtitle:Text('كسب ${e.value['coins']} عملة • مكافأة ${e.value['gold']} ذهب • ${e.value['diamonds']} ماس • ${e.value['days']} أيام'),trailing:IconButton(icon:const Icon(Icons.edit),onPressed:()=>_edit(e.key)))))),
  ActionButton(label:'إضافة مستوى جديد',icon:Icons.add,onTap:()=>_add())
 ])));
 void _add(){setState(()=>levels.add({'name':'تاركت جديد','coins':15000000,'gold':2000000,'diamonds':1500,'days':7,'icon':Icons.emoji_events}));}
 void _edit(int i){final l=levels[i];final c=TextEditingController(text:'${l['coins']}');showDialog(context:context,builder:(_)=>AlertDialog(title:Text('تعديل ${l['name']}'),content:TextField(controller:c,keyboardType:TextInputType.number,decoration:const InputDecoration(labelText:'حد كسب الهدايا بالعملة')),actions:[TextButton(onPressed:()=>Navigator.pop(context),child:const Text('إلغاء')),FilledButton(onPressed:(){l['coins']=int.tryParse(c.text)??l['coins'];setState((){});Navigator.pop(context);},child:const Text('حفظ'))]));}
}
