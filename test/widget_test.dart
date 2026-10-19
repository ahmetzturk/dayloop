import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dayloop/app.dart';

void main() {
  testWidgets('Uygulama Bugün ekranıyla açılıyor', (WidgetTester tester) async {
    await tester.pumpWidget(const DayloopApp());

    // Biri ekran başlığı, biri alt menüdeki sekme
    expect(find.text('Bugün'), findsNWidgets(2));
  });

  testWidgets('Alt menüde beş sekme var', (WidgetTester tester) async {
    await tester.pumpWidget(const DayloopApp());

    expect(find.byType(NavigationDestination), findsNWidgets(5));
  });

  testWidgets('Sekmeye basınca ilgili ekran açılıyor', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DayloopApp());

    for (final title in [
      'Görevler',
      'Notlar',
      'Rutinler',
      'Ayarlar',
      'Bugün',
    ]) {
      await tester.tap(
        find.descendant(
          of: find.byType(NavigationBar),
          matching: find.text(title),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.descendant(of: find.byType(AppBar), matching: find.text(title)),
        findsOneWidget,
      );
    }
  });
}
