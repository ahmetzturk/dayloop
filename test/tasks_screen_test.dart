import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dayloop/screens/tasks/tasks_screen.dart';

void main() {
  testWidgets('Görev yokken bilgi mesajı görünüyor', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: TasksScreen()));

    expect(find.textContaining('Henüz görev yok'), findsOneWidget);
  });

  testWidgets('Başlık boşken görev kaydedilmiyor', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TasksScreen()));

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Kaydet'));
    await tester.tap(find.text('Kaydet'));
    await tester.pumpAndSettle();

    // Form ekranında kalınır ve hata mesajı görünür
    expect(find.text('Başlık boş olamaz'), findsOneWidget);
    expect(find.text('Yeni Görev'), findsOneWidget);
  });

  testWidgets('Eklenen görev listede görünüyor', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TasksScreen()));

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Başlık'),
      'Diş hekimi randevusu',
    );
    await tester.ensureVisible(find.text('Kaydet'));
    await tester.tap(find.text('Kaydet'));
    await tester.pumpAndSettle();

    expect(find.text('Diş hekimi randevusu'), findsOneWidget);
    expect(find.textContaining('Henüz görev yok'), findsNothing);
  });

  testWidgets('Kutucuğa basınca görev tamamlanıyor', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: TasksScreen()));

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.widgetWithText(TextFormField, 'Başlık'),
      'Sabah koşusu',
    );
    await tester.ensureVisible(find.text('Kaydet'));
    await tester.tap(find.text('Kaydet'));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.value, isTrue);
  });
}
