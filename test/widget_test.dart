import 'package:flutter_test/flutter_test.dart';

import 'package:dayloop/app.dart';

void main() {
  testWidgets('Uygulama açılıyor', (WidgetTester tester) async {
    await tester.pumpWidget(const DayloopApp());

    expect(find.text('Dayloop'), findsOneWidget);
  });
}
