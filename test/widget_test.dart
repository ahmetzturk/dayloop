import 'package:flutter_test/flutter_test.dart';

import 'package:dayloop/app.dart';

void main() {
  testWidgets('Uygulama Bugün ekranıyla açılıyor', (WidgetTester tester) async {
    await tester.pumpWidget(const DayloopApp());

    // Biri ekran başlığı, biri alt menüdeki sekme
    expect(find.text('Bugün'), findsNWidgets(2));
  });
}
