import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:menalive_flutter/main.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const MenaLiveApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
